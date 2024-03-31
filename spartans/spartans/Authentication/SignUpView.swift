//
//  SignUpView.swift
//  spartans
//
//  Created by Keertikumar Kubareea on 2024-03-29.
//

import SwiftUI

@MainActor
final class SignUpViewModel : ObservableObject {
    
    @Published var email = ""
    @Published var pw = ""
    @Published var confirm_pw = ""
    @Published var firstname = ""
    @Published var lastname = ""
    @Published var dob = Date()
    
    @Published var errorMessage: String?
    @Published var successMessage: String?

    
    init(){
        self.errorMessage = nil
        self.successMessage = nil
    }

    func signup(){
        guard !email.isEmpty, !pw.isEmpty, !confirm_pw.isEmpty, !firstname.isEmpty, !lastname.isEmpty  else {
            errorMessage = "Please fill out all forms"
            return
        }
        
        // TODO: Verifiy if email is already present in firebase database
//        Task{
//            do{
//                if try AuthenticationManager.shared.verifyIfEmailAlreadyExists(email: email){
//                    errorMessage = "Email already in use. Try signing in instead"
//                    return
//                }
//            }catch{
//                errorMessage = "Error: Email already in use. Try signing in instead"
//            }
//        }
        
        guard confirm_pw == pw else {
                errorMessage = "Passwords do not match"
                return
            }
        
        let today = Date()
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: dob, to: today)
        guard let age = ageComponents.year, age >= 18 else {
            errorMessage = "You must be at least 18 years old to sign up"
            return
        }
        
        Task{
            do{
                let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, pw: pw)
                successMessage = "Account created!"
                print("Success")
                print(returnedUserData)
            } catch {
                errorMessage = "Error: \(error)"
            }
        }
    }
}

struct SignUpView: View {
    @StateObject private var viewModel = SignUpViewModel()
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Text("Firstname: ")
                    TextField("Type firstname here", text: $viewModel.firstname)
                        .padding()
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(10)
                }.padding()
                HStack{
                    Text("Lastname: ")
                    TextField("Type lastname here", text: $viewModel.lastname)
                        .padding()
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(10)
                }.padding()
                HStack{
                    Text("Email: ")
                    TextField("Type email here", text: $viewModel.email)
                        .padding()
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(10)
                }.padding()
                HStack{
                    Text("Create password: ")
                    SecureField("Type password here", text: $viewModel.pw)
                        .padding()
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(10)
                }.padding()
                HStack{
                    Text("Confirm password: ")
                    SecureField("Retype password here", text: $viewModel.confirm_pw)
                        .padding()
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(10)
                }.padding()
                DatePicker(
                        "Date of birth:",
                        selection: $viewModel.dob,
                        displayedComponents: [.date]
                    )
                .padding()
                if let errorMessage = viewModel.errorMessage {
                    // If there is a success message, don't print the previous error message
                    if let successMessage = viewModel.successMessage{}else{
                        // print error message if there is no success message
                        Text(errorMessage)
                            .foregroundColor(.red)
                    }
                }
                Button{
                    viewModel.signup()
                } label: {
                    Text("Sign up")
                }
                .buttonStyle(.borderedProminent)
                .padding()
                
                Text("Already have an account?")
                NavigationLink {
                    SignInView()
                } label: {
                    Text("Sign in instead")
                }.padding(.bottom, 10)
                if let successMessage = viewModel.successMessage {
                    Text(successMessage)
                        .foregroundColor(.green)
                }
                
            }.navigationTitle("New User")
        }
    }
}

#Preview {
    NavigationStack{
        SignUpView()
    }
}

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
                Button{
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
                
            }.navigationTitle("New User")
        }
    }
}

#Preview {
    NavigationStack{
        SignUpView()
    }
}

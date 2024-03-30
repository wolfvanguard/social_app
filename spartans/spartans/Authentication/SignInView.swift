//
//  SignInView.swift
//  spartans
//
//  Created by Keertikumar Kubareea on 2024-03-29.
//

import SwiftUI

final class SignInEmailViewModel : ObservableObject {
    
    @Published var email = ""
    @Published var pw = ""
    
}

struct SignInView: View {
    
    @StateObject private var viewModel = SignInEmailViewModel()
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Text("Username: ")
                    TextField("Type username here", text: $viewModel.email)
                        .padding()
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(10)
                }.padding()
                HStack{
                    Text("Password: ")
                    SecureField("Type password here", text: $viewModel.pw)
                        .padding()
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(10)
                }.padding()
                
                Button(action: {
                    
                }, label: {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: 200)
                        .background(Color.blue)
                        .cornerRadius(10)
                }).padding()
                
                Text("New user?")
                NavigationLink{
                    SignUpView()
                } label: {
                    Text ("Sign up instead").underline(true)
                }
                Spacer()
                
                
                
            }.background().padding().cornerRadius(60.0).navigationTitle("Sign in with email").background()
        }
    }
}

#Preview {
    NavigationStack{
        SignInView()
    }
}

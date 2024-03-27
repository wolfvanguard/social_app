//
//  LoginView.swift
//  spartans
//
//  Created by Keertikumar Kubareea on 2024-03-22.
//

import SwiftUI

struct LoginView: View {
    @State private var username:String = ""
    @State private var pw:String = ""
    
    @Binding var signin_requested:Bool
    @Binding var signup_requested:Bool
    
    var body: some View {
        ZStack{
            Image("bar_login").resizable().ignoresSafeArea()
            VStack{
                
                Text("Enter your login details").padding(.top, 20).padding(.bottom, 30).font(.largeTitle)
                HStack{
                    Text("Username: ")
                    TextField("Type username here", text: $username)
                }.padding()
                HStack{
                    Text("Password: ")
                    TextField("Type password here", text: $pw)
                }.padding()
                Button{
                    signin()
                } label: {
                    Text("Sign In")
                }
                .buttonStyle(.borderedProminent)
                .padding()
                
                Button {
                    signup()
                } label: {
                    Text("Sign up instead")
                }.padding()

                
            }.background().padding().cornerRadius(60.0)
        }
    }
    
    func signin(){
        //User authentication and send to home page
    }
    
    func signup(){
        //Send to sign up page
        self.signin_requested = false
        self.signup_requested = true
    }
    
    
}

#Preview {
    LoginView(signin_requested: .constant(false), signup_requested: .constant(false))
}

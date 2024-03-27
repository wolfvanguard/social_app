//
//  SignupView.swift
//  spartans
//
//  Created by Keertikumar Kubareea on 2024-03-26.
//

import SwiftUI

struct SignupView: View {
    
    @State private var firstname:String = ""
    @State private var lastname:String = ""
    @State private var username:String = ""
    @State private var pw:String = ""
    @State private var pw2:String = ""
    
    @Binding var siginin_requested:Bool
    @Binding var signup_requested:Bool

    
    var body: some View {
        ZStack{
            Image("bar_login").resizable().ignoresSafeArea()
            VStack{
                
                Text("Enter your information").padding(.top, 20).padding(.bottom, 30).font(.largeTitle)
                HStack{
                    Text("Firstname: ")
                    TextField("Type firstname here", text: $username)
                }.padding()
                HStack{
                    Text("Lastname: ")
                    TextField("Type lastname here", text: $lastname)
                }.padding()
                HStack{
                    Text("Email: ")
                    TextField("Type email here", text: $username)
                }.padding()
                HStack{
                    Text("Password: ")
                    TextField("Type password here", text: $pw)
                }.padding()
                HStack{
                    Text("Retype Password: ")
                    TextField("Retype password here", text: $pw2)
                }.padding()
                Button{
                    signup()
                } label: {
                    Text("Sign up")
                }
                .buttonStyle(.borderedProminent)
                .padding()
                
                Text("Already have an account?")
                Button {
                    signin()
                } label: {
                    Text("Sign in instead")
                }.padding(.bottom, 10)

                
            }.background().padding().cornerRadius(60.0)
        }
    }
    
    func signin(){
        //Direct to signin page
        siginin_requested = true
        signup_requested = false
        
    }
    func signup(){
        //Direct to home screen/ User is signed up
    }
}

#Preview {
    SignupView(siginin_requested: .constant(false), signup_requested: .constant(false))
}

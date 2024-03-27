//
//  ContentView.swift
//  spartans
//
//  Created by Keertikumar Kubareea on 2024-03-21.
//

import SwiftUI

struct ContentView: View {
    @Binding var signin_requested:Bool
    @Binding var signup_requested:Bool
    var body: some View {
        // ZStack is the background to foreground stack
        // Higher in the ZStack means deeper in the background
        ZStack {
            Color(.gray).ignoresSafeArea()
            VStack {
                Image("bar_login")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(/*@START_MENU_TOKEN@*/15.0/*@END_MENU_TOKEN@*/)
                
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    
                
                HStack{
                    Image(systemName: "star.leadinghalf.fill").foregroundColor(.orange)
                    Text("Sparks")
                        .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                        .fontWeight(/*@START_MENU_TOKEN@*/.semibold/*@END_MENU_TOKEN@*/)
                    // Download the free SF Symbols app to know the symbol name
                    Image(systemName: "star.leadinghalf.fill").foregroundColor(.orange)
                }
                
                Text("Let's re-kindle the magic between people")
                    .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)
                Button(action: {
                    login()
                }, label: {
                    Text("Login")
                })
                .buttonStyle(.borderedProminent)
                Text("New user?")
                Button(action: {
                    signup()
                }, label: {
                    Text("Signup")
                        .underline(true)
                })
                .buttonStyle(.borderless)
                
            }
        }

    }
    
    func login(){
        self.signin_requested = true
        self.signup_requested = false
    }
    func signup(){
        self.signup_requested = true
        self.signup_requested = false
    }
}


#Preview {
    ContentView(signin_requested: .constant(false), signup_requested: .constant(false))
}

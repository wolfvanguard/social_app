//
//  AuthView.swift
//  spartans
//
//  Created by Keertikumar Kubareea on 2024-03-29.
//

import SwiftUI

struct AuthView: View {
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
                
                NavigationLink{
                    SignInView()
                } label:{
                    Text("Sign In with Email")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: 200)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Text("New user?")
                NavigationLink{
                    SignUpView()
                } label: {
                    Text ("Sign up instead").underline(true)
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        AuthView()
    }
}

//
//  ContentView.swift
//  spartans
//
//  Created by Keertikumar Kubareea on 2024-03-21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.gray).ignoresSafeArea()
            VStack {
                Image("bar_login")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(/*@START_MENU_TOKEN@*/15.0/*@END_MENU_TOKEN@*/)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                Text("Sparks")
                    .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.semibold/*@END_MENU_TOKEN@*/)
                
                Text("Let's re-kindle the magic between people")
                    .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                Button("Login") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    /*
                     Leads to login page for email/username and password
                     */
                }
                .buttonStyle(.borderedProminent)
                Text("New user?")
                Button("Sign Up instead") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    /*
                     Leads to signup page for email/username and password
                     */
                }
                .buttonStyle(.borderless)
            }
        }

    }
}

#Preview {
    ContentView()
}

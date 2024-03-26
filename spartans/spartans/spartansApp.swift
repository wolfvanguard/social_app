//
//  spartansApp.swift
//  spartans
//
//  Created by Keertikumar Kubareea on 2024-03-21.
//

import SwiftUI

@main
struct spartansApp: App {
    @State var signin_requested:Bool = false
    @State var signup_requested:Bool = false
    var body: some Scene {
        WindowGroup {
            if (signin_requested){
                LoginView(signin_requested: $signin_requested, signup_requested: $signup_requested)
            } else if (signup_requested){
                SignupView()
            } else{
                ContentView(signin_requested: $signin_requested, signup_requested: $signup_requested)
            }
        }
    }
}

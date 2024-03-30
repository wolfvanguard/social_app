//
//  spartansApp.swift
//  spartans
//
//  Created by Keertikumar Kubareea on 2024-03-21.
//

import SwiftUI
import Firebase

@main
struct spartansApp: App {
    
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    
    @State var signin_requested:Bool = false
    @State var signup_requested:Bool = false
    var body: some Scene {
        WindowGroup {
            if (signin_requested){
                LoginView(signin_requested: $signin_requested, signup_requested: $signup_requested)
            } else if (signup_requested){
                SignupView(siginin_requested: $signin_requested, signup_requested: $signup_requested)
            } else{
                ContentView(signin_requested: $signin_requested, signup_requested: $signup_requested)
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

//
//  HomePageView.swift
//  spartans
//
//  Created by Keertikumar Kubareea on 2024-03-27.
//

import SwiftUI

struct HomePageView: View {
    
    @State private var showSignInView: Bool = false
    // Boolean that determines if user needs to be directed to sign in page
    
    var body: some View {
        ZStack{
            NavigationStack{
                SettingsView(showSignInView: $showSignInView)
            }
        }
        .onAppear {
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showSignInView = authUser == nil
            // if true, will be directed to sign in view
            // if false, authenticated user found locally, show homeview
        }
        .fullScreenCover(isPresented: $showSignInView) {
            NavigationStack{
                AuthView()
            }
        }
    }
}

#Preview {
    HomePageView()
}

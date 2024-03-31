//
//  SettingsView.swift
//  spartans
//
//  Created by Keertikumar Kubareea on 2024-03-31.
//

import SwiftUI

@MainActor
final class SettingsViewModel: ObservableObject {
    
    
    func signOut() throws{
        try AuthenticationManager.shared.signout()
    }
}

struct SettingsView: View {
    
    // Need to initialize a view model object
    @StateObject private var viewModel = SettingsViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        List{
            Button("Log out"){
                Task {
                    do {
                        try viewModel.signOut()
                        showSignInView = true
                    } catch {
                        print (error)
                    }
                }
                
            }
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    NavigationStack{
        SettingsView(showSignInView: .constant(false))
    }
}

//
//  AuthenticationManager.swift
//  spartans
//
//  Created by Keertikumar Kubareea on 2024-03-29.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel{
    let uid:String
    let email:String?
    let photoUrl:String?
    
    init(user: User){
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
}

final class AuthenticationManager{
    
    static let shared = AuthenticationManager()
    private init(){}
    
    // Not asynchronous -> gonna check for the authenticated user locally -> not reaching out to the server
    func getAuthenticatedUser() throws -> AuthDataResultModel{
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        return AuthDataResultModel(user: user)
    }
    
    // Asynchronous -> this function is going to reach out to the server to firebase
    func createUser(email:String, pw:String) async throws -> AuthDataResultModel{
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: pw)
        return AuthDataResultModel(user: authDataResult.user)
    }
    
    // Sign out locally, do not neet to ping the server -> no async needed
    func signout() throws{
        try Auth.auth().signOut()
    }
    
    // TODO: Asynchronous -> need to ping the server to see if this email is already present on sign in
    func verifyIfEmailAlreadyExists(email:String) throws -> Bool{
        if let authDataResult = try Auth.auth().getStoredUser(forAccessGroup: email){
            return true
        }
        return false
    }
}

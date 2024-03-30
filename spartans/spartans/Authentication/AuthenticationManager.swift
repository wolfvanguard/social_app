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
    
    func createUser(email:String, pw:String) async throws -> AuthDataResultModel{
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: pw)
        return AuthDataResultModel(user: authDataResult.user)
    }
}

//
//  AuthenticationManager.swift
//  spartans
//
//  Created by Keertikumar Kubareea on 2024-03-29.
//

import Foundation
import FirebaseAuth

final class AuthenticationManager{
    
    static let shared = AuthenticationManager()
    private init(){}
    
    func createUser(email:String, pw:String) async throws{
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: pw)
    }
    
}

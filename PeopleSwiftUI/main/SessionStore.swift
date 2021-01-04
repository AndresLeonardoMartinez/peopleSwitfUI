//
//  SessionStore.swift
//  PeopleSwiftUI
//
//  Created by Andrés Martínez on 03/09/2020.
//  Copyright © 2020 Andrés Martínez. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

class SessionStore: ObservableObject {
    
    @Published var session: User?
    var handle: AuthStateDidChangeListenerHandle?
    
    func listen () {
        // monitor authentication changes using firebase
        handle = Auth.auth().addStateDidChangeListener { [weak self] (auth, user) in
            if let user = user {
                // if we have a user, create a new user model
                print("Got user: \(user)")
                self?.session = User(
                    uid: user.uid,
                    displayName: user.displayName
                )
            } else {
                // if we don't have a user, set our session to nil
                self?.session = nil
            }
        }
    }
    
    func signUp(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }
    
    func signIn(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }
    
    func signOut () -> Bool {
        do {
            try Auth.auth().signOut()
            self.session = nil
            return true
        } catch {
            return false
        }
    }
    
    func unbind () {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    
    
}

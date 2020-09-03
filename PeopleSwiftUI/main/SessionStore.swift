//
//  SessionStore.swift
//  PeopleSwiftUI
//
//  Created by Andrés Martínez on 03/09/2020.
//  Copyright © 2020 Andrés Martínez. All rights reserved.
//

import Foundation
import Firebase

class SessionStore: ObservableObject {
    
    @Published var session: User?
    
    func listen () {
        // monitor authentication changes using firebase
        _ = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                // if we have a user, create a new user model
                print("Got user: \(user)")
                self.session = User(
                    uid: user.uid,
                    displayName: user.displayName
                )
            } else {
                // if we don't have a user, set our session to nil
                self.session = nil
            }
        }
    }
    
    
    
}

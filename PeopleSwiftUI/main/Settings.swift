//
//  Settings.swift
//  PeopleSwiftUI
//
//  Created by Andrés Martínez on 03/09/2020.
//  Copyright © 2020 Andrés Martínez. All rights reserved.
//

import Combine
import Foundation

class Settings: ObservableObject {
    
    @Published var auth: AuthLocal
    let tokenKey = "token"
    
    init() {
        let defaults = UserDefaults.standard
        self.auth = AuthLocal()
        if let token = defaults.string(forKey: tokenKey) {
            self.auth.token = token
        }
    }
    
    func saveToken(_ token: String) {
        UserDefaults.standard.set(token, forKey: tokenKey)
    }
    
    func removeToken() {
        auth.token = nil
        UserDefaults.standard.set(nil, forKey: tokenKey)
    }
    
}

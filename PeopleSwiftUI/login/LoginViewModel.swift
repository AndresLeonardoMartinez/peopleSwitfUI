//
//  LoginViewModel.swift
//  PeopleSwiftUI
//
//  Created by Andrés Martínez on 02/09/2020.
//  Copyright © 2020 Andrés Martínez. All rights reserved.
//

import Combine

class LoginViewModel: ObservableObject {
    
    @Published var auth: Auth? = nil
    @Published var successful = false
    
    func login(username: String, password: String) {
        //WIP
        //post to some api
        if username.uppercased() == "ANDRES" && password.uppercased() == "ANDRES123" {
            self.auth?.token = "123"
            self.successful = true
        } else {
            self.successful = false
        }
        
    }
}

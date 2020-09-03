//
//  LoginViewModel.swift
//  PeopleSwiftUI
//
//  Created by Andrés Martínez on 02/09/2020.
//  Copyright © 2020 Andrés Martínez. All rights reserved.
//

import Combine

class LoginViewModel: ObservableObject {
    
    @Published var settings: Settings? = nil
    @Published var successful = false
    
    func login(username: String, password: String) {
        //WIP
        //post to some api
        if username.uppercased() == "ANDRES" && password.uppercased() == "ANDRES123" {
            let token = "token"
            self.settings?.auth.token = token
            self.settings?.saveToken(token)
            self.successful = true
        } else {
            self.successful = false
        }
        
    }
}

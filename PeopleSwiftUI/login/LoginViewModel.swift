//
//  LoginViewModel.swift
//  PeopleSwiftUI
//
//  Created by Andrés Martínez on 02/09/2020.
//  Copyright © 2020 Andrés Martínez. All rights reserved.
//

import Combine

class LoginViewModel: ObservableObject {
    
    @Published var session: SessionStore? = nil
    @Published var successful = false
    
    func login(username: String, password: String) {
        //WIP
        //post to some api
        
        session?.signIn(email: username, password: password, handler: { (result, error) in
            if error != nil {
                print("error \(error!.localizedDescription)")
            }
            //updateUI
        })
        //            let token = "token"
        //            self.settings?.auth.token = token
        //            self.settings?.saveToken(token)
        
    }
}

//
//  LoginView.swift
//  PeopleSwiftUI
//
//  Created by Andrés Martínez on 02/09/2020.
//  Copyright © 2020 Andrés Martínez. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct LoginView: View {
    @State private var isLoggin = false
    @State var username: String = ""
    @State var password: String = ""
    @State var error: Error? = nil
    @State var loading = false
    @EnvironmentObject var session: SessionStore    
    
    func login() {
        self.loading = true
        self.error = nil
        session.signIn(email: self.username, password: self.password) { (result, error) in
            self.error = error
            self.loading = false
        }
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Username")
                    .font(.callout)
                    .bold()
                TextField("username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("password")
                    .font(.callout)
                    .bold()
                SecureField("password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                
                
            }.padding(32)
            if error != nil {
                Text("ops... There was an error").foregroundColor(.red)
            }
            ActivityIndicator(self.$loading)
            Button(action: {
                self.login()
            }) {
                Text("Login")
            }
        }
    }
}

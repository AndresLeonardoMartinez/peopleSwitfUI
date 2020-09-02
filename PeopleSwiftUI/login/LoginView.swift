//
//  LoginView.swift
//  PeopleSwiftUI
//
//  Created by Andrés Martínez on 02/09/2020.
//  Copyright © 2020 Andrés Martínez. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @State private var isLoggin = false
    @State var username: String = ""
    @State var password: String = ""
    @ObservedObject var auth: Auth
    @ObservedObject var viewModel = LoginViewModel()
    
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
                
                
            }.padding()
            Button(action: {
                self.viewModel.auth = self.auth
                self.viewModel.login(username: self.username, password: self.password)
            }) {
                Text("Login")
            }
        }
    }
}

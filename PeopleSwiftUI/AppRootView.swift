//
//  AppRootView.swift
//  PeopleSwiftUI
//
//  Created by Andrés Martínez on 02/09/2020.
//  Copyright © 2020 Andrés Martínez. All rights reserved.
//

import SwiftUI

struct AppRootView: View {

    @ObservedObject var auth: Auth
    
    var body: some View {
        Group {
            if auth.token == nil {
                LoginView(auth: auth)
            } else {
                PeopleListView(auth: auth)
            }
        }
    }
}

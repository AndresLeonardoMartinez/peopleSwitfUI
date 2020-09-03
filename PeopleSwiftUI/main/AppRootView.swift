//
//  AppRootView.swift
//  PeopleSwiftUI
//
//  Created by Andrés Martínez on 02/09/2020.
//  Copyright © 2020 Andrés Martínez. All rights reserved.
//

import SwiftUI

struct AppRootView: View {
    
    @EnvironmentObject var session: SessionStore
    
    func getUser() {
        session.listen()
    }
    
    var body: some View {
        Group {
            if session.session == nil {
                LoginView()
            } else {
                PeopleListView()
            }
        }.onAppear(perform: getUser)
    }
}

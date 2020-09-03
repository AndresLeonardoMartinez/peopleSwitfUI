//
//  AppRootView.swift
//  PeopleSwiftUI
//
//  Created by Andrés Martínez on 02/09/2020.
//  Copyright © 2020 Andrés Martínez. All rights reserved.
//

import SwiftUI

struct AppRootView: View {

    @EnvironmentObject var settings: Settings
    
    var body: some View {
        Group {
            if settings.auth.token == nil {
                LoginView()
            } else {
                PeopleListView()
            }
        }
    }
}

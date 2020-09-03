//
//  PeopleListView.swift
//  PeopleSwiftUI
//
//  Created by Andrés Martínez on 31/08/2020.
//  Copyright © 2020 Andrés Martínez. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct PeopleListView: View {
    
    @ObservedObject var viewModel = PeopleViewModel()
    @EnvironmentObject var settings: Settings
    
    var body: some View {
        NavigationView {
            if viewModel.dataSource.isEmpty {
                ActivityIndicator(self.$viewModel.loading)
            } else {
                List(viewModel.dataSource) { person in
                    NavigationLink(destination: PersonDetailsView(person: person)) {
                        PersonCell(person: person)
                    }
                }.navigationBarTitle("People")
                    .navigationBarItems(trailing:
                        Button("logout") {
                            self.settings.removeToken()
                        }
                )
            }
        }
    }
}

struct PersonCell: View {
    let person: Person
    var body: some View {
        HStack {
            HStack(alignment: .center, spacing: 16) {
                WebImage(url: person.url).resizable().frame(width: 50, height: 50)
                VStack(alignment: .leading, spacing: 8) {
                    Text(person.fullname).font(.title)
                    Text(person.email).font(.subheadline)
                }
            }
        }
    }
}


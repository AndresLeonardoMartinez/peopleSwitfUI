//
//  PersonDetailsView.swift
//  PeopleSwiftUI
//
//  Created by Andrés Martínez on 01/09/2020.
//  Copyright © 2020 Andrés Martínez. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct PersonDetailsView: View {
    let person: Person
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            WebImage(url: URL(string: person.picture.large)).resizable().frame(width: 150, height: 150).clipShape(Circle())
            Text(person.fullname).font(.largeTitle)
            Text(person.gender.rawValue).font(.subheadline)
            Text(person.location.country).font(.subheadline)
            Text(person.email).font(.subheadline)
            Spacer()
        }
    }
}

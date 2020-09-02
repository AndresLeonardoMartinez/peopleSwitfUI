//
//  PeopleResponse.swift
//  PeopleSwiftUI
//
//  Created by Andrés Martínez on 31/08/2020.
//  Copyright © 2020 Andrés Martínez. All rights reserved.
//

import Foundation

// MARK: - People
struct People: Codable {
    let results: [Person]
}


// MARK: - Person
struct Person: Codable, Identifiable {
    let gender: Gender
    let name: Name
    var fullname: String {
        return name.first + " " + name.last
    }
    var url: URL {
        return URL(string: picture.thumbnail)!
    }
    let location: Location
    let email: String
//    let login: Login
//    let dob, registered: Dob
//    let phone, cell: String
    let id = UUID()
    let picture: Picture
    let nat: String
    
    
}

// MARK: - Name
struct Name: Codable {
    let title, first, last: String
}

// MARK: - Picture
struct Picture: Codable {
    let large, medium, thumbnail: String
}

struct Location: Codable {
    let country: String
}

enum Gender: String, Codable {
    case female = "female"
    case male = "male"
}

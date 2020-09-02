//
//  PeopleViewModel.swift
//  PeopleSwiftUI
//
//  Created by Andrés Martínez on 01/09/2020.
//  Copyright © 2020 Andrés Martínez. All rights reserved.
//

import Combine
import SwiftUI

class PeopleViewModel: ObservableObject {
    
    @Published var dataSource: [Person] = []
    @Published var loading = true
    var cancellable: AnyCancellable?
    
    init() {
        fetchPeople()
    }
    
    func fetchPeople() {
        Webservice().loadPeople() { [weak self] (people) in
            self?.dataSource = people
            self?.loading = false
        }
    }
    
    func goToDetails(of person: Person) {
        print("showing details of \(person.fullname)")
    }
    
    func deleteFirst() {
        dataSource.remove(at: 0)
    }
    
}

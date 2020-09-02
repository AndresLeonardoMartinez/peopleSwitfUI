//
//  Webservice.swift
//  PeopleSwiftUI
//
//  Created by Andrés Martínez on 01/09/2020.
//  Copyright © 2020 Andrés Martínez. All rights reserved.
//

import Foundation

class Webservice {
    
    func loadPeople(completion: @escaping ([Person]) -> ()) {
        let url = URL(string: "https://randomuser.me/api/?results=50")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                completion([])
                return
            }
            
            let response = try? JSONDecoder().decode(People.self, from: data)
            if let response = response {
                DispatchQueue.main.async {
                    completion(response.results)
                }
            }
        }.resume()
        
    }
    
}

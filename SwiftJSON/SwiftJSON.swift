//
//  SwiftJSON.swift
//  signupfirebase
//
//  Created by Jan  on 22/10/2020.
//  Copyright © 2020 Jan . All rights reserved.

import SwiftUI

/// Sjekke json: https://jsonformatter.curiousconcept.com/#

// MARK: - Person
struct Person: Codable, Identifiable {
    var id: String
    var author: Author
    var personData: PersonData
    var timestamp: Int64
}

// MARK: - Author
struct Author:Codable {
    var email: String
    var photoURL: String
    var uid: String
    var username: String
}

// MARK: - PersonData
struct PersonData:Codable {
    var address: String
    var city: String
    var dateOfBirth1: String
    var dateOfBirth2: String
    var firstName: String
    var gender: Int
    var lastName: String
    var municipality: String
    var municipalityNumber: String
    var name: String
    var personEmail: String
    var phoneNumber: String
    var photoURL: String
    var postalCodeNumber: String
}

struct SwiftJSON: View {
    
    let jsonFile = "Data.json"

    @State var result : [Person] = []
    
    var body: some View{
        List(result) {a in
            Text(a.personData.firstName + " " + a.personData.lastName)
        }
        .onAppear(perform: parseJson)
    }
    
    func parseJson() {
        
        if let url = Bundle.main.url(forResource: jsonFile, withExtension: nil) {

            if let data = try? Data(contentsOf: url){

                let jsondecoder = JSONDecoder()

                do{
                    let result = try jsondecoder.decode([Person].self, from: data)
                    self.result = result

                }
                catch {
                    print("error trying parse json")
                }
            }
        } else {
            print("Unknown json file")
        }
        
    }
}

//
//  Users.swift
//  WeHR
//
//  Created by Phal Madina on 6/10/24.
//

import Foundation


struct Users: Identifiable,Decodable {
    var id = UUID()
    var name: String
    var email: String
}

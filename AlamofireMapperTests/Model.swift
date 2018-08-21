//
//  Model.swift
//  AlamofreMapperTests
//
//  Created by Sua Le on 8/21/18.
//  Copyright © 2018 Sua Le. All rights reserved.
//

import Foundation

class UserResponse: Decodable {
    var page: Int!
    var per_page: Int!
    var total: Int!
    var total_pages: Int!
    
    var data: [User]?
}

class User: Decodable {
    var id: Double!
    var first_name: String!
    var last_name: String!
    var avatar: String!
}

class Movie: Decodable {
    var id: String!
    var name: String!
    var movies: Array<String>!
    var createdAt: Date?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case movies = "movies[]"
        case createdAt
    }
}


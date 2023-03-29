//
//  Constructor.swift
//  
//
//  Created by Lorenzo Brescanzin on 22/03/23.
//

import Foundation

public struct Constructor: Equatable, Identifiable {
    public let id: String
    public let name: String
    public let nationality: String
    public let url: String
}

extension Constructor: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id = "constructorId"
        case name
        case nationality
        case url
    }
}

extension Constructor: APIResponseDecodable {
    public static var tableName: String {
        "StandingsTable"
    }
    
    public static var parentName: String {
        "StandingsLists"
    }
    
    public static var childName: String? {
        "ConstructorStandings"
    }
}

extension Constructor: StandingsDecodable {
    public static var competitorKey: String {
        "Constructor"
    }
}

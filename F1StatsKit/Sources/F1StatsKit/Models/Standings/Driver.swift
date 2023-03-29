//
//  Driver.swift
//  
//
//  Created by Lorenzo Brescanzin on 22/03/23.
//

import Foundation

public struct Driver: Equatable, Identifiable {
    public let firstName: String
    public let lastName: String
    public let code: String
    public var id: String {
        code
    }
}

extension Driver: Decodable {
    private enum CodingKeys: String, CodingKey {
        case firstName = "givenName"
        case lastName = "familyName"
        case code
    }
}

extension Driver: APIResponseDecodable {
    public static var tableName: String {
        "StandingsTable"
    }
    
    public static var parentName: String {
        "StandingsLists"
    }
    
    public static var childName: String? {
        "DriverStandings"
    }
}

extension Driver: StandingsDecodable {
    public static var competitorKey: String {
        "Driver"
    }
}

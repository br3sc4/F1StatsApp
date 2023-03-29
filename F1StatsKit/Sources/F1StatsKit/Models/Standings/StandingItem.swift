//
//  StandingItem.swift
//  
//
//  Created by Lorenzo Brescanzin on 22/03/23.
//

import Foundation

public struct StandingItem<Competitor>: Equatable where Competitor : Equatable, Competitor : StandingsDecodable {
    public let position: Int
    public let points: Int
    public let wins: Int
    public let competitor: Competitor
    
    public init(position: Int, points: Int, wins: Int, competitor: Competitor) {
        self.position = position
        self.points = points
        self.wins = wins
        self.competitor = competitor
    }
}

extension StandingItem: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.position = Int(try container.decode(String.self, forKey: CodingKeys(stringValue: JsonKeys.position.rawValue)))!
        self.points = Int(try container.decode(String.self, forKey: CodingKeys(stringValue: JsonKeys.points.rawValue)))!
        self.wins = Int(try container.decode(String.self, forKey: CodingKeys(stringValue: JsonKeys.wins.rawValue)))!
        self.competitor = try container.decode(Competitor.self, forKey: CodingKeys(stringValue: Competitor.competitorKey))
    }
    
    private enum JsonKeys: String {
        case position
        case points
        case wins
    }
}

extension StandingItem: APIResponseDecodable where Competitor : APIResponseDecodable {
    public static var tableName: String {
        Competitor.tableName
    }
    
    public static var parentName: String {
        Competitor.parentName
    }
    
    public static var childName: String? {
        Competitor.childName
    }
}

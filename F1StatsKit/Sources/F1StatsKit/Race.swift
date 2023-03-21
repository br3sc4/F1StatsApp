//
//  Race.swift
//  
//
//  Created by Lorenzo Brescanzin on 21/03/23.
//

import Foundation

public struct Race {
    let name: String
    let round: String
    let date: Date
    
    public init(name: String, round: String, date: Date) {
        self.name = name
        self.round = round
        self.date = date
    }
}

// MARK: Decodable
extension Race: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.round = try container.decode(String.self, forKey: .round)
        let date = try container.decode(String.self, forKey: .date)
        let time = try container.decode(String.self, forKey: .time)
        self.date = ISO8601DateFormatter().date(from: [date, time].joined(separator: "T"))!
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "raceName",
             round,
             date,
             time
    }
}

//
//  Race.swift
//  
//
//  Created by Lorenzo Brescanzin on 21/03/23.
//

import Foundation

public struct Race: Equatable {
    public let name: String
    public let round: String
    public let date: Date
    public let circuit: Circuit
    
    public init(name: String, round: String, date: Date, circuit: Circuit) {
        self.name = name
        self.round = round
        self.date = date
        self.circuit = circuit
    }
}

// MARK: Decodable
extension Race: APIResponseDecodable {
    public static var tableName: String {
        "RaceTable"
    }
    
    public static var parentName: String {
        "Races"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try container.decode(String.self, forKey: .name)
        self.round = try container.decode(String.self, forKey: .round)
        let date = try container.decode(String.self, forKey: .date)
        let time = try container.decode(String.self, forKey: .time)
        self.date = ISO8601DateFormatter()
            .date(from: [date, time].joined(separator: "T"))!
        self.circuit = try container.decode(Circuit.self, forKey: .circuit)
    }
    
    private enum CodingKeys: String, CodingKey {
        case name = "raceName"
        case round
        case date
        case time
        case circuit = "Circuit"
    }
}

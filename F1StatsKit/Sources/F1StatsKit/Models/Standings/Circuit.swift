//
//  Circuit.swift
//  
//
//  Created by Lorenzo Brescanzin on 21/03/23.
//

import Foundation

extension Race {
    public struct Circuit: Decodable {
        public let id: String
        public let name: String
        public let location: Location
        
        public init(id: String, name: String, location: Location) {
            self.id = id
            self.name = name
            self.location = location
        }
        
        private enum CodingKeys: String, CodingKey {
            case id = "circuitId"
            case name = "circuitName"
            case location = "Location"
        }
    }
}

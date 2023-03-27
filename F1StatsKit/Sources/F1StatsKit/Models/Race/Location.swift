//
//  Location.swift
//  
//
//  Created by Lorenzo Brescanzin on 21/03/23.
//

import Foundation

extension Race.Circuit {
    public struct Location: Equatable, Decodable {
        public let longitude: String
        public let latitude: String
        public let locality: String
        public let country: String
        
        public init(longitude: String, latitude: String, locality: String, country: String) {
            self.longitude = longitude
            self.latitude = latitude
            self.locality = locality
            self.country = country
        }
        
        private enum CodingKeys: String, CodingKey {
            case longitude = "long"
            case latitude = "lat"
            case locality
            case country
        }
    }
}

//
//  StandingsWrapper.swift
//  
//
//  Created by Lorenzo Brescanzin on 28/03/23.
//

import Foundation

public struct StandingsWrapper<T> {
    public let standing: [T]
}

extension StandingsWrapper: Decodable where T : APIResponseDecodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        standing = try container.decode([T].self, forKey: CodingKeys(stringValue: T.childName!))
    }
}

extension StandingsWrapper: APIResponseDecodable where T : APIResponseDecodable {
    public static var tableName: String {
        T.tableName
    }
    
    public static var parentName: String {
        T.parentName
    }
}

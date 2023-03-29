//
//  DecodingUtils.swift
//  
//
//  Created by Lorenzo Brescanzin on 28/03/23.
//

import Foundation

struct MRData<T>: Decodable where T : APIResponseDecodable {
    let table: Table<T>
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        table = try container.decode(Table<T>.self,
                                     forKey: CodingKeys(stringValue: T.tableName))
    }
}

struct Table<T>: Decodable where T : APIResponseDecodable {
    let content: T
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        content = try container.decode(T.self,
                                       forKey: CodingKeys(stringValue: T.parentName))
        
        if let child = T.childName {
            let container2 = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: CodingKeys(stringValue: child))
            print(try container2.decode([StandingItem<Driver>].self, forKey: CodingKeys(stringValue: child)))
        }
    }
}

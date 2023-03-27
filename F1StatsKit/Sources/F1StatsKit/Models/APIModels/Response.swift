//
//  Response.swift
//  
//
//  Created by Lorenzo Brescanzin on 23/03/23.
//

import Foundation

public protocol F1StatsAPIResponseDecodable: Decodable {
    static var tableName: String { get }
    static var parentName: String { get }
}

struct Response<T>: Decodable where T: F1StatsAPIResponseDecodable {
    let data: MRData<T>
    
    var content: [T] {
        data.table.content
    }
    
    private enum CodingKeys: String, CodingKey {
        case data = "MRData"
    }
}

struct MRData<T>: Decodable where T: F1StatsAPIResponseDecodable {
    let table: Table<T>
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        table = try container.decode(Table<T>.self,
                                     forKey: CodingKeys(stringValue: T.tableName))
    }
    
    private struct CodingKeys: CodingKey {
        var stringValue: String
        var intValue: Int?
        
        init(stringValue: String) {
            self.stringValue = stringValue
        }
        
        init?(intValue: Int) {
            self.stringValue = intValue.formatted()
            self.intValue = intValue
        }
    }
}

struct Table<T>: Decodable where T: F1StatsAPIResponseDecodable {
    let content: [T]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        content = try container.decode([T].self,
                                       forKey: CodingKeys(stringValue: T.parentName))
    }
    
    private struct CodingKeys: CodingKey {
        var stringValue: String
        var intValue: Int?
        
        init(stringValue: String) {
            self.stringValue = stringValue
        }
        
        init?(intValue: Int) {
            self.stringValue = intValue.formatted()
            self.intValue = intValue
        }
    }
}

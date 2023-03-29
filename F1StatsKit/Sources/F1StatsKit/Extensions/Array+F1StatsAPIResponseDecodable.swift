//
//  Array+F1StatsAPIResponseDecodable.swift
//  
//
//  Created by Lorenzo Brescanzin on 28/03/23.
//

import Foundation

extension Array: APIResponseDecodable where Element : APIResponseDecodable {
    public static var tableName: String {
        Element.tableName
    }
    
    public static var parentName: String {
        Element.parentName
    }
}

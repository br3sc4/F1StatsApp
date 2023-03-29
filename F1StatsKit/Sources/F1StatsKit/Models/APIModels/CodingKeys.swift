//
//  CodingKeys.swift
//  
//
//  Created by Lorenzo Brescanzin on 28/03/23.
//

import Foundation

struct CodingKeys: CodingKey {
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

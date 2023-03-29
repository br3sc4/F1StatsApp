//
//  Response.swift
//  
//
//  Created by Lorenzo Brescanzin on 23/03/23.
//

import Foundation

struct Response<T>: Decodable where T : APIResponseDecodable {
    let data: MRData<T>
    
    var content: T {
        data.table.content
    }
    
    private enum CodingKeys: String, CodingKey {
        case data = "MRData"
    }
}

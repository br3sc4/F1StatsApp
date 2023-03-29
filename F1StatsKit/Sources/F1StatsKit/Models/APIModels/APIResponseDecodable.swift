//
//  APIResponseDecodable.swift
//  
//
//  Created by Lorenzo Brescanzin on 28/03/23.
//

import Foundation

public protocol APIResponseDecodable: Decodable {
    static var tableName: String { get }
    static var parentName: String { get }
    static var childName: String? { get }
}

extension APIResponseDecodable {
    public static var childName: String? { nil }
}

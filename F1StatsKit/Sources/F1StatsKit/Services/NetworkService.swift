//
//  NetworkService.swift
//  
//
//  Created by Lorenzo Brescanzin on 22/03/23.
//

import Foundation

public protocol NetworkService {
    func fetch<T>(_ type: T.Type, from url: URL) async throws -> T where T : APIResponseDecodable
}

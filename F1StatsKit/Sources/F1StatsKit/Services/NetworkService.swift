//
//  NetworkService.swift
//  
//
//  Created by Lorenzo Brescanzin on 22/03/23.
//

import Foundation

public protocol NetworkService {
    func fetch<T>(from url: URL) async throws -> [T] where T : F1StatsAPIResponseDecodable
}

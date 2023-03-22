//
//  URLSessionService.swift
//  
//
//  Created by Lorenzo Brescanzin on 22/03/23.
//

import Foundation

public final class URLSessionService: NetworkService {
    private let session = URLSession.shared
    
    public func fetch<T>(from url: URL) async throws -> T where T : Decodable {
        let request = URLRequest(url: url, cachePolicy: .reloadRevalidatingCacheData)
        let (data, _) = try await session.data(for: request)
        return try JSONDecoder().decode(T.self, from: data)
    }
}

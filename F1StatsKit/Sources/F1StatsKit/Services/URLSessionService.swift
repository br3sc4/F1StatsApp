//
//  URLSessionService.swift
//  
//
//  Created by Lorenzo Brescanzin on 22/03/23.
//

import Foundation

public final class URLSessionService: NetworkService {
    private let session = URLSession.shared
    
    public init() {}
    
    public func fetch<T>(_ type: T.Type, from url: URL) async throws -> T where T : APIResponseDecodable {
        let request = URLRequest(url: url, cachePolicy: .reloadRevalidatingCacheData)
        let (data, _) = try await session.data(for: request)
        let decodedData = try JSONDecoder().decode(Response<T>.self, from: data)
        
        return decodedData.content
    }
}

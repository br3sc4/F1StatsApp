//
//  URLDirector.swift
//  
//
//  Created by Lorenzo Brescanzin on 22/03/23.
//

import Foundation

public final class URLFactory {
    private var urlComponents = URLComponents(string: URLConstants.base.rawValue)!
    
    public init() {}
    
    func makeRacesURL() -> URL {
        urlComponents.path = URLConstants.racesPath.rawValue
        return urlComponents.url!
    }
    
    func makeDriversStandingURL() -> URL {
        urlComponents.path = URLConstants.driversStandings.rawValue
        return urlComponents.url!
    }
    
    func makeConstructorsStandingURL() -> URL {
        urlComponents.path = URLConstants.constructorsStandings.rawValue
        return urlComponents.url!
    }
}

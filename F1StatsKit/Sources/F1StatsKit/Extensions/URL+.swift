//
//  URLDirector.swift
//  
//
//  Created by Lorenzo Brescanzin on 22/03/23.
//

import Foundation

extension URL {
    private static var baseURL: URL {
        URL(string: "https://ergast.com/api/f1/current")!
    }
    
    public static var races: URL {
        baseURL.appendingPathExtension("json")
    }
    
    public static var driversStanging: URL {
        baseURL.appending(path: "/driversStandings.json")
    }
    
    public static var constructorsStanding: URL {
        baseURL.appending(path: "/constructorsStandings.json")
    }
}

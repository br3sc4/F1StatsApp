//
//  Season.swift
//  
//
//  Created by Lorenzo Brescanzin on 21/03/23.
//

import Foundation

public struct Season {
    public private(set) var races: [Race]
    
    public init(races: [Race]) {
        self.races = races
    }
}

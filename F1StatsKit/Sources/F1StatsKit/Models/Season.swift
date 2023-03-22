//
//  Season.swift
//  
//
//  Created by Lorenzo Brescanzin on 21/03/23.
//

import Foundation

public struct Season {
    public let races: [Race]
    public let driversStanding: StandingItem<Driver>
    public let constructorStanding: StandingItem<Constructor>
    
    public init(
        races: [Race],
        driverStanding: StandingItem<Driver>,
        constructorStanding: StandingItem<Constructor>
    ) {
        self.races = races
        self.driversStanding = driverStanding
        self.constructorStanding = constructorStanding
    }
}

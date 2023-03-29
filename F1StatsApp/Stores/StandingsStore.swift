//
//  StandingsStore.swift
//  F1StatsApp
//
//  Created by Lorenzo Brescanzin on 29/03/23.
//

import Foundation
import F1StatsKit
import Combine

final class StandingsStore {
    private var drivers: [StandingItem<Driver>] = []
    private var constructors: [StandingItem<Constructor>] = []
    
    private let service: NetworkService
    
    var subject = PassthroughSubject<Void, Never>()
    
    init(service: NetworkService) {
        self.service = service
        
        loadData()
    }
    
    private func loadData() {
        Task {
            do {
                async let drivers = service.fetch(
                    [StandingsWrapper<StandingItem<Driver>>].self,
                    from: .driversStanding
                ).flatMap(\.standing)
                
                async let constructors = service.fetch(
                    [StandingsWrapper<StandingItem<Constructor>>].self,
                    from: .constructorsStanding
                ).flatMap(\.standing)
                
                self.drivers = try await drivers
                self.constructors = try await constructors
                subject.send()
            } catch {
                debugPrint(error)
            }
        }
    }
    
    func fetchDriverByID(_ id: Driver.ID) -> StandingItem<Driver>? {
        return drivers.first { driverStandingItem in
            driverStandingItem.competitor.id == id
        }
    }
    
    func fetchConstructorByID(_ id: Constructor.ID) -> StandingItem<Constructor>? {
        return constructors.first { constructorStandingItem in
            constructorStandingItem.competitor.id == id
        }
    }
    
    func fetchDriversPodium() -> [Driver.ID] {
        return drivers.map(\.competitor.id)
            .dropLast(drivers.count - 3)
    }
    
    func fetchConstructorsPodium() -> [Constructor.ID] {
        return constructors.map(\.competitor.id)
            .dropLast(constructors.count - 3)
    }
}

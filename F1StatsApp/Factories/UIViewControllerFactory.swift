//
//  UIViewControllerFactory.swift
//  F1StatsApp
//
//  Created by Lorenzo Brescanzin on 22/03/23.
//

import UIKit
import F1StatsKit

final class UIViewControllerFactory: ViewControllerFactory {
    private let networkService: NetworkService = URLSessionService()
    
    func makeRacesViewController() -> UIViewController {
        let vc = RacesViewController(service: networkService)
        vc.title = "Races"
        return vc
    }
}

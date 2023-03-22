//
//  UIViewControllerFactory.swift
//  F1StatsApp
//
//  Created by Lorenzo Brescanzin on 22/03/23.
//

import UIKit

final class UIViewControllerFactory: ViewControllerFactory {
    func makeRacesViewController() -> UIViewController {
        return RacesViewController()
    }
}

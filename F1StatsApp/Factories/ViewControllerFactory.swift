//
//  ViewControllerFactory.swift
//  F1StatsApp
//
//  Created by Lorenzo Brescanzin on 22/03/23.
//

import UIKit

protocol ViewControllerFactory {
    func makeRacesViewController() -> UIViewController
}

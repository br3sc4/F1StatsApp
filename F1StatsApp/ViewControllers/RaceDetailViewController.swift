//
//  RaceDetailViewController.swift
//  F1StatsApp
//
//  Created by Lorenzo Brescanzin on 24/03/23.
//

import UIKit
import F1StatsKit

final class RaceDetailViewController: UIViewController {
    var race: Race? {
        didSet {
            guard let race else { return }
            title = race.circuit.location.country
            circuitView.circuit = race.circuit
        }
    }

    private let circuitView = CircuitDetailView()
    
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        
        configureCircuitView()
        setupLayoutConstraints()
    }
    
    // MARK: Views configuration
    private func configureCircuitView() {
        circuitView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(circuitView)
    }

    // MARK: Layout constraints setup
    private func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            circuitView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            circuitView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

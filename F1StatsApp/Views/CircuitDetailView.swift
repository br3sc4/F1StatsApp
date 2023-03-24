//
//  CircuitDetailView.swift
//  F1StatsApp
//
//  Created by Lorenzo Brescanzin on 24/03/23.
//

import UIKit
import F1StatsKit

final class CircuitDetailView: UIView {
    var circuit: Race.Circuit? {
        willSet {
            guard let newValue else { return }
            nameLabel.text = newValue.name
            localityLabel.text = newValue.location.locality
            countryLabel.text = newValue.location.country
        }
    }
    
    private let stackView = UIStackView()
    private let nameLabel = UILabel()
    private let localityLabel = UILabel()
    private let countryLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureStackView()
        configureNameLabel()
        configureLocalityLabel()
        configureCountryLabel()
        
        setupLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Views configuration
    private func configureStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(localityLabel)
        stackView.addArrangedSubview(countryLabel)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
    }
    
    private func configureNameLabel() {
        nameLabel.font = .boldSystemFont(ofSize: 20)
        nameLabel.textColor = .label
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLocalityLabel() {
        localityLabel.font = .systemFont(ofSize: 15)
        localityLabel.textColor = .label
        localityLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureCountryLabel() {
        countryLabel.font = .systemFont(ofSize: 15)
        countryLabel.textColor = .label
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: Layout constraints setup
    private func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

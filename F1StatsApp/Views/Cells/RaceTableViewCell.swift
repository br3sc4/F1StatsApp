//
//  RaceTableViewCell.swift
//  F1StatsApp
//
//  Created by Lorenzo Brescanzin on 22/03/23.
//

import UIKit
import F1StatsKit

final class RaceTableViewCell: UITableViewCell {
    var race: Race? {
        willSet {
            guard let newValue else { return }
            roundLabel.text = "Round \(newValue.round)"
            localityLabel.text = newValue.circuit.location.locality
            nameLabel.text = newValue.name
            dateLabel.text = newValue.date.formatted(date: .numeric, time: .shortened)
        }
    }
    
    private let roundLabel = UILabel()
    private let localityLabel = UILabel()
    private let nameLabel = UILabel()
    private let dateLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        
        contentView.addSubview(roundLabel)
        contentView.addSubview(localityLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(dateLabel)
        
        configureRoundLabel()
        configureLocalityLabel()
        configureNameLabel()
        configureDateLabel()
        
        setupLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Views configuration
    private func configureRoundLabel() {
        roundLabel.font = .systemFont(ofSize: 15)
        roundLabel.textColor = .systemRed
        roundLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLocalityLabel() {
        localityLabel.font = .boldSystemFont(ofSize: 20)
        localityLabel.textColor = .label
        localityLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureNameLabel() {
        nameLabel.font = .systemFont(ofSize: 15)
        nameLabel.textColor = .secondaryLabel
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureDateLabel() {
        dateLabel.font = .systemFont(ofSize: 15)
        dateLabel.textColor = .secondaryLabel
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: Layout constraints setup
    private func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            // Round UILabel
            roundLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            roundLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            
            // Locality UILabel
            localityLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            localityLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            // Name UILabel
            nameLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            
            // Date UILabel
            dateLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            dateLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor)
        ])
    }
}

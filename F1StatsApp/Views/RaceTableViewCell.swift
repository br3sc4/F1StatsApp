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

        configureContentView()
        configureRoundLabel()
        configureLocalityLabel()
        configureNameLabel()
        configureDateLabel()
        
        setupLayoutConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let edgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        contentView.frame = contentView.frame.inset(by: edgeInsets)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Views configuration
    private func configureContentView() {
        contentView.backgroundColor = .systemBackground
        contentView.layer.cornerRadius = 8
    }
    
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
            roundLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            roundLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            localityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            localityLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8)
        ])
    }
}

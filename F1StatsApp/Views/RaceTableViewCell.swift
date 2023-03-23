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
            nameLabel.text = newValue.name
            dateLabel.text = newValue.date.formatted(date: .numeric, time: .shortened)
        }
    }
    
    private var roundLabel = UILabel()
    private var nameLabel = UILabel()
    private var dateLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        
        contentView.addSubview(roundLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(dateLabel)

        configureContentView()
        configureRoundLabel()
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
    
    private func configureNameLabel() {
        nameLabel.font = .boldSystemFont(ofSize: 20)
        nameLabel.textColor = .label
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
            nameLabel.topAnchor.constraint(equalTo: roundLabel.bottomAnchor, constant: 4),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}

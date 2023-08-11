//
//  ButtonCell.swift
//  TolstiyHwCalculator
//
//  Created by Матвей on 01.08.2023.
//

import UIKit

class ButtonCell: UICollectionViewCell {
    static let identifier = "ButtonCell"
    
    private(set) var calculatorButton: CalculatorButton!
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 40, weight: .regular)
        label.text = "Error"
        return label
    }()
    
    public func configure(with calculatorButton: CalculatorButton) {
        self.calculatorButton = calculatorButton
        self.titleLabel.text = calculatorButton.title
        self.backgroundColor = calculatorButton.color
        
        switch calculatorButton {
        case .allClear, .plusMinus, .percent:
            self.titleLabel.textColor = .black
        default:
            self.titleLabel.textColor = .white
        }
        self.setupUI()
    }
    
    private func setupUI() {
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        switch self.calculatorButton {
        case let .number(Int) where Int == 0:
            self.layer.cornerRadius = 36
            let extraSpace = self.frame.width - self.frame.height
            NSLayoutConstraint.activate([
                self.titleLabel.heightAnchor.constraint(equalToConstant: self.frame.height),
                self.titleLabel.widthAnchor.constraint(equalToConstant: self.frame.height),
                self.titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -extraSpace)
            ])
        default:
            self.layer.cornerRadius = self.frame.size.width/2
            NSLayoutConstraint.activate([
                self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                self.titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                self.titleLabel.heightAnchor.constraint(equalTo: self.heightAnchor),
                self.titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor)
            ])
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.titleLabel.removeFromSuperview()
    }
    
}

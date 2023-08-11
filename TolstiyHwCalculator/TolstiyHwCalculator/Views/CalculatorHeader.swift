//
//  CalculatorHeaderCell.swift
//  TolstiyHwCalculator
//
//  Created by Матвей on 01.08.2023.
//

import UIKit

class CalculatorHeader: UICollectionReusableView {
    static let identifier = "CalculatorHeader"
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 72, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(currentCalculatorText: String) {
        label.text = currentCalculatorText
    }
    
    private func setupUI() {
        self.backgroundColor = .black
        self.addSubview(label)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            self.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            self.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor),
        ])
    }
}

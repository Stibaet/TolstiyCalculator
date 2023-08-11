//
//  ViewController.swift
//  TolstiyHwCalculator
//
//  Created by Матвей on 01.08.2023.
//

import UIKit

class CalculatorController: UIViewController {

    let viewModel: CalculatorControllerViewModel
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        collectionView.register(CalculatorHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CalculatorHeader.identifier)
        collectionView.register(ButtonCell.self, forCellWithReuseIdentifier: ButtonCell.identifier)
        return collectionView
    }()

    init(_ viewModel: CalculatorControllerViewModel = CalculatorControllerViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    private func setupUI() {
        self.view.addSubview(self.collectionView)
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
}

extension CalculatorController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CalculatorHeader.identifier, for: indexPath) as? CalculatorHeader else {
            fatalError("Failed to dequeue CalculcatorHeader")
        }
        header.configure(currentCalculatorText: viewModel.calculatorHeaderLabel)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let totalCellHeight = view.frame.size.width
        let totalVerticalCellSpacing = CGFloat(10*4)
        let window = view.window?.windowScene?.keyWindow
        let topPadding = window?.safeAreaInsets.top ?? 0
        let bottomPadding = window?.safeAreaInsets.bottom ?? 0
        
        let availableScreenHeight = view.frame.size.height - topPadding - bottomPadding
        let headerHeight = (availableScreenHeight - totalCellHeight) - totalVerticalCellSpacing
        return CGSize(width: view.frame.size.width, height: headerHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.calculatorButtonCells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ButtonCell.identifier, for: indexPath) as? ButtonCell else {
            fatalError("Failed to dequeue ButtonCell")
        }
        let calculatorButton = self.viewModel.calculatorButtonCells[indexPath.row]
        cell.configure(with: calculatorButton)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let calculatorButton = self.viewModel.calculatorButtonCells[indexPath.row]
        
        switch calculatorButton {
        case let .number(Int) where Int == 0:
            return CGSize(
                width: (view.frame.size.width/5)*2 + ((view.frame.size.width/5)/3),
                height: view.frame.size.width/5)
        default:
            return CGSize(width: view.frame.size.width/5, height: view.frame.size.width/5)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return (view.frame.size.width/5)/3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let buttonCell = viewModel.calculatorButtonCells[indexPath.row]
        print(buttonCell.title)
    }
}

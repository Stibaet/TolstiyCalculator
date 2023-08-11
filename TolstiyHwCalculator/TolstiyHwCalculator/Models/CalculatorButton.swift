//
//  CalculatorButton.swift
//  TolstiyHwCalculator
//
//  Created by Матвей on 01.08.2023.
//

import UIKit

enum CalculatorButton {
    case allClear
    case plusMinus
    case percent
    case divide
    case multiply
    case subtract
    case add
    case equals
    case number(Int)
    case decimal
    
    init(calcButton: CalculatorButton) {
        switch calcButton {
        case .allClear:
            self = calcButton
        case .plusMinus:
            self = calcButton
        case .percent:
            self = calcButton
        case .divide:
            self = calcButton
        case .multiply:
            self = calcButton
        case .subtract:
            self = calcButton
        case .add:
            self = calcButton
        case .equals:
            self = calcButton
        case .number(let int):
            self = calcButton
        case .decimal:
            self = calcButton
        }
    }
}

extension CalculatorButton {
    
    var title: String {
        switch self {
        case .allClear:
            return "AC"
        case .plusMinus:
            return "+/-"
        case .percent:
            return "%"
        case .divide:
            return "÷"
        case .multiply:
            return "x"
        case .subtract:
            return "-"
        case .add:
            return "+"
        case .equals:
            return "="
        case .number(let int):
            return int.description
        case .decimal:
            return "."
        }
    }
    
    var color: UIColor {
        switch self {
        case .allClear, .plusMinus, .percent:
            return .lightGray
        case .divide, .multiply, .subtract, .add, .equals:
            return .systemOrange
        case .number, .decimal:
            return .darkGray
        }
    }
    
    var selectedColor: UIColor {
        switch self {
        case .allClear, .plusMinus, .percent, .equals, .number, .decimal:
            return .lightGray
        case .divide, .multiply, .subtract, .add:
            return .white
        }
    }
}

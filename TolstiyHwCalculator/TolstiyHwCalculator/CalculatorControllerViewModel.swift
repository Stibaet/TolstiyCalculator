//
//  CalculatorControllerViewModel.swift
//  TolstiyHwCalculator
//
//  Created by Матвей on 01.08.2023.
//

import Foundation

class CalculatorControllerViewModel {
    let calculatorButtonCells: [CalculatorButton] = [
        .allClear, .plusMinus, .percent, .divide,
        .number(7), .number(8), .number(9), .multiply,
        .number(4), .number(5), .number(6), .subtract,
        .number(1), .number(2), .number(3), .add,
        .number(0), .decimal, .equals
    ]
    
    private(set) var calculatorHeaderLabel : String = "0"
}





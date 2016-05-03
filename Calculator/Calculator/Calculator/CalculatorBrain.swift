//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Lina on 4/28/16.
//  Copyright © 2016 Lina. All rights reserved.
//

import Foundation

class CalculatorBrain{
    
    private var accumulator = 0.0
    
    func setOperand (operand: Double) {
        accumulator = operand
    }

    var operations: Dictionary<String,Operation> = [
        "∏": Operation.Constant(M_PI),
        "e": Operation.Constant(M_E),
        "√": Operation.UnaryOperation(sqrt), // sqrt
        "cos": Operation.UnaryOperation(cos) // cos
    ]
    enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation
        case Equals
    }

    func perfornOperation(symbol: String){
        if let operation = operations[symbol]{
            switch operation {
            case .Constant(let value): accumulator = value
            case .UnaryOperation(let foo): accumulator = foo(accumulator)
            default: break
            }
        }
    }
    var result : Double {
        get {
            return accumulator
        }
    }
}
//
//  CalculatorModel.swift
//  Calculator
//
//  Created by Mohab Mohamed's on 7/19/19.
//  Copyright © Mohab Mohamed. All rights reserved.
//

import Foundation


struct CalculatorModel {
    private var number : Double?
    
    private var calculatorTuple : (num1 : Double , sym : String)?
    
    
    mutating func setNumber(_ number : Double){
        self.number = number
    }
    
    mutating func calculator(symbol : String) -> Double?{
        
        
        if let num = number{
            switch symbol{
            case "+/-":
                return num * -1
            case "AC":
                return 0
            case "%":
                return num * 0.01
            case "=":
                return secondNumber(n2: num)
            default:
                calculatorTuple = (num1 : num , sym : symbol)
                
            
            }
            
        }
        return nil
    }
    
    
    private func secondNumber(n2: Double) -> Double?{
        
        if let num = calculatorTuple?.num1 , let operationSymbol = calculatorTuple?.sym {
            
            switch operationSymbol {
            case "+":
                return num + n2
            case "-":
                return num - n2
            case "×":
                return num * n2
            case "÷":
                return num / n2
            default:
                fatalError("the symbol doesnot match any operator...")
                
            
            }
            
        }
        
        return nil
        
    }
    
}

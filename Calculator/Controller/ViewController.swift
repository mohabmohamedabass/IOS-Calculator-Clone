//
//  ViewController.swift
//  Calculator
//
//  Created by Mohab Mohamed on 17/07/2019.
//  Copyright © Mohab Mohamed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinished : Bool = true
    
    private var displayValue : Double{
        get{
            
            guard let number = Double(displayLabel.text!) else {
                fatalError("cannot convert to double.")
            }
            
            return number
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorModel()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
    
        isFinished = true
        
        calculator.setNumber(displayValue)

        if let calculationMethod = sender.currentTitle {
            
            if let result = calculator.calculator(symbol: calculationMethod){
                displayValue = result
            }
            
            
            
        }
    
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        
        if let newValue = sender.currentTitle{
            
            if isFinished {
                displayLabel.text = newValue
                isFinished = false
            }else{
                
                if newValue == "."{
                    
                   
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                    
                }
                
                displayLabel.text = displayLabel.text! + newValue
                
            }
            
            
        }
    
    }

}


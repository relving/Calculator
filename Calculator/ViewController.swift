//
//  ViewController.swift
//  Calculator
//
//  Created by Lena Azmi on 28/01/2019.
//  Copyright © 2019 Lena Azmi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen : Double = 0
    var previousNumber : Double = 0
    var performingMath : Bool = false
    var operation : Int = 0
    var result : Double = 0
    
    @IBOutlet weak var screenLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenLabel.text = ""
    }

    @IBAction func numbersPressed(_ sender: UIButton) {
        
        if performingMath {
            
            screenLabel.text = String(sender.tag - 1)
            numberOnScreen = Double(screenLabel.text!)!
            performingMath = false
            
            print("Number on Screen: \(numberOnScreen)")
        }
        else {
            
            screenLabel.text = screenLabel.text! + String(sender.tag - 1)
            numberOnScreen = Double(screenLabel.text!)!
            
            print("Number on Screen: \(numberOnScreen)")
        }
    }
  
    
    @IBAction func mathButtonPressed(_ sender: UIButton) {
        
        if screenLabel.text != "" && sender.tag != 11 && sender.tag != 16 {
            
            previousNumber = Double(screenLabel.text!)!
            
            screenLabel.text = previousNumber.isInt ? String(Int(previousNumber)) : String(previousNumber)
            
            performingMath = true
            operation = sender.tag
            print("Previous number: \(previousNumber)")
            
        }
        
        else if sender.tag == 16 {
            
            if operation == 12 {
                // dividing
                result = previousNumber / numberOnScreen
            }
            else if operation == 13 {
                // multiplication
                result = previousNumber * numberOnScreen
                
            }
            else if operation == 14 {
                // substraction
                result = previousNumber - numberOnScreen
                
            }
            else if operation == 15 {
                // addition
                result = previousNumber + numberOnScreen
            }
            
            screenLabel.text = result.isInt ? String(Int(result)) : String(result)
            
            print("Result: \(result)")
            
        }
        else if sender.tag == 11 {
            // reset button
            screenLabel.text = ""
            previousNumber = 0
            numberOnScreen = 0
            performingMath = false
        }
        
    }
    
    @IBAction func additionalButtonsPressed(_ sender: UIButton) {
        
        if sender.tag == 18 {
            // %
            numberOnScreen = numberOnScreen / 100
            screenLabel.text = "\(numberOnScreen)"
            performingMath = false
            print("Number on Screen: \(numberOnScreen)")
            
        }
        if sender.tag == 17 {
            // +-
            screenLabel.text = screenLabel.text!.contains("-") ? String(fabs(numberOnScreen)) : "-" + screenLabel.text!
            numberOnScreen = -numberOnScreen
            
            print("Number on Screen: \(numberOnScreen)")
        }
        else if sender.tag == 19 {
            // .
            if screenLabel.text!.contains(".") == false {
                screenLabel.text = screenLabel.text! + "."
            }
            
            print("Number on Screen: \(numberOnScreen)")
        }
        
    }
    
    
    
}

extension Double {
    var isInt: Bool {
        return floor(self) == self
    }
}

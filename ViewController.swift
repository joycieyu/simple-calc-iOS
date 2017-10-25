//
//  ViewController.swift
//  simple-calc-iOS
//
//  Created by Joycie Yu on 10/24/17.
//  Copyright © 2017 Joycie Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var result: UIViewController!
    @IBOutlet weak var screen: UILabel!
    
    var opList = [String]()
    var numList = [Int]()
    
    
    // number buttons
    @IBAction func button9(_ sender: Any) {
        numList.append(9)
        screen.text = "9"
        NSLog("9")
    }
    @IBAction func button8(_ sender: Any) {
        numList.append(8)
        screen.text = "8"
    }
    @IBAction func button7(_ sender: Any) {
        numList.append(7)
        screen.text = "7"
    }
    @IBAction func button6(_ sender: Any) {
        numList.append(6)
        screen.text = "6"
    }
    @IBAction func button5(_ sender: Any) {
        numList.append(5)
        screen.text = "5"
    }
    @IBAction func button4(_ sender: Any) {
       numList.append(4)
        screen.text = "4"
    }
    @IBAction func button3(_ sender: Any) {
        numList.append(3)
        screen.text = "3"
    }
    @IBAction func button2(_ sender: Any) {
        numList.append(2)
        screen.text = "2"
    }
    @IBAction func button1(_ sender: Any) {
        numList.append(1)
        screen.text = "1"
    }
    @IBAction func button0(_ sender: Any) {
        numList.append(0)
        screen.text = "0"
    }
    
    // operations
    @IBAction func mod(_ sender: Any) {
        opList.append("%")
        screen.text = "%"
    }
    @IBAction func divide(_ sender: Any) {
        opList.append("/")
        screen.text = "/"
    }
    @IBAction func multiply(_ sender: Any) {
        opList.append("x")
        screen.text = "x"
    }
    @IBAction func subtract(_ sender: Any) {
        opList.append("-")
        screen.text = "-"
    }
    @IBAction func add(_ sender: Any) {
        opList.append("+")
        screen.text = "+"
    }
    @IBAction func count(_ sender: Any) {
        opList.append("count")
        screen.text = "Count"
    }
    @IBAction func avg(_ sender: Any) {
        opList.append("avg")
        screen.text = "Avg"
    }
    @IBAction func fact(_ sender: Any) {
        opList.append("fact")
        screen.text = "Fact"
    }
    
    // complete operation
    @IBAction func equals(_ sender: Any) {
        var total = 0
        var op = opList[0]
        for index in 1...opList.count - 1 {
            let val = numList[index - 1]
            op = opList[index]
          
            switch op {
            case "+" :
                total += val
            case "-" :
                total -= val
            case "/" :
                total /= val
            case "x" :
                total *= val
            case "%" :
                total = Int(Double(total).truncatingRemainder(dividingBy: Double(val)))
            case "count" :
                if index == opList.count - 1 {
                    total = (numList.count - 1)
                }
            case "avg":
                if index == opList.count - 1 {
                    for i in 0...(numList.count - 1){
                        total += numList[i]
                    }
                    total /= (numList.count - 1)
                }
            case "fact":
                var factSum = 1
                let stopVal = numList[0]
                if (stopVal > 0) {
                    for i in 1...stopVal {
                        factSum = factSum * i
                    }
                } else {
                    for i in stopVal...(-1) {
                        factSum = factSum * i
                    }
                }
            total = factSum
            default :
                total += 0
            }
        }
      screen.text = "\(total)"
    }
    
    @IBAction func clear(_ sender: Any) {
        opList = []
        numList = []
        screen.text = ""
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


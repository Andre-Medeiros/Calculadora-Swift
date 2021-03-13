//
//  ViewController.swift
//  CALCULADORA
//
//  Created by Andre on 12/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    var firstNum: String = "0";
    var secondNun: String = "0";
    var thirdNum: String = "0";
    var operacao: String = "";
    var temResultado: Bool = false;
    var resultadoNum: String = "";
    
    
    @IBAction func add(_ sender: Any) {
        operacao = "+";
    }
    
    @IBAction func subtracao(_ sender: Any) {
        operacao = "-";
    }
    
    @IBAction func multiplicacao(_ sender: Any) {
        operacao = "x";
    }
    
    @IBAction func divisao(_ sender: Any) {
        operacao = "/";
    }
    
    @IBAction func igual(_ sender: Any) {
        resultadoNum = String(doOperation());
        let numArray = resultadoNum.components(separatedBy: ".")
        if numArray[1] == "0" {
            numNaTela.text = numArray[0];
        }else {
            numNaTela.text = resultadoNum;
        }
        if !temResultado {
            thirdNum = "0";
            
        } else if thirdNum == "0" {
            thirdNum = secondNun;
        }
        
    }
    
    @IBOutlet weak var numNaTela: UILabel!
    
    @IBOutlet var calcButtons: [UIButton]!
    
    @IBAction func numPress(_ sender: UIButton) {
        if operacao == "" {
            firstNum = String(sender.tag);
            numNaTela.text = firstNum;
        
        }else if operacao != "" && !temResultado {
            secondNun = String(sender.tag);
            numNaTela.text = secondNun;
            
        }else if operacao != "" && temResultado{
            thirdNum = String(sender.tag);
            numNaTela.text = thirdNum;
            
        }
    }
    
    @IBAction func clear(_ sender: Any) {
        firstNum = "0";
        secondNun = "0";
        thirdNum = "0";
        operacao = "";
        temResultado = false;
        resultadoNum = "";
        numNaTela.text = "0";
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for button in calcButtons {
            button.layer.cornerRadius = button.frame.size.height / 12;
            button.titleLabel?.font = UIFont(name: "System", size: 32);
        }
    }
    
    func doOperation() -> Double {

            if operacao == "+" {
                if !temResultado {
                    temResultado = true
                    return Double(firstNum)! + Double(secondNun)!;
                }else{
                    return Double(resultadoNum)! + Double(thirdNum)!;
                }
                
            }else if operacao == "-"{
                if !temResultado {
                    temResultado = true;
                    return Double(firstNum)! - Double(secondNun)!;
                } else {
                    return Double(resultadoNum)! - Double(thirdNum)!;
                }
                
            }else if operacao == "x"{
                if !temResultado {
                    temResultado = true;
                    return Double(firstNum)! * Double(secondNun)!;
                } else {
                    return Double(resultadoNum)! * Double(thirdNum)!;
                }
                
            }else if operacao == "/"{
                if !temResultado {
                    temResultado = true;
                    return Double(firstNum)! / Double(secondNun)!;
                } else {
                    return Double(resultadoNum)! / Double(thirdNum)!;
                }
            }
        return 0;
    }

}


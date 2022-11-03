//
//  ViewController.swift
//  Conversores
//
//  Created by Ana Paula Lesniovski dos Santos on 01/09/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var btUnit1: UIButton!
    @IBOutlet weak var btUnit2: UIButton!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var lbResultUnit: UILabel!
    @IBOutlet weak var lbUnit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    //.text! optional de string -> desembrulha. P/ btns não se usa .text, usa-se -> setTitle
    //for: .normal????
    @IBAction func showNext(_ sender: UIButton) {
        switch lbUnit.text! {
        case "Temperatura":
            lbUnit.text = "Peso"
            btUnit1.setTitle("Quilograma", for: .normal)
            btUnit2.setTitle("Libra", for: .normal)
        case "Peso":
            lbUnit.text = "Moeda"
            btUnit1.setTitle("Real", for: .normal)
            btUnit2.setTitle("Dólar", for: .normal)
        case "Moeda":
            lbUnit.text = "Distância"
            btUnit1.setTitle("Metro", for: .normal)
            btUnit2.setTitle("Quilômetro", for: .normal)
        default:
            lbUnit.text = "Temperatura"
            btUnit1.setTitle("Celsius", for: .normal)
            btUnit2.setTitle("Farenheint", for: .normal)
        }
        //sempre que clicar no lbUnit, já chama a função convert, e faz a conversão automaticamente de acordo com o tipo. lbUnit é o label e o botão? como ocorre essa interação de clicar e mudar, automatica?
        //nill pq UIButton? não é um btn pq n tem nenhum btn pra isso, é um optional de btn
        convert(nil)
    }
    //pq UIButton é nill, não estou definindo valores pra ele já? teoricamente eu sei que não vai ser nill
    @IBAction func convert(_ sender: UIButton?) {
        if let sender = sender {
            if sender == btUnit1 {
                btUnit2.alpha = 0.5
            } else {
                btUnit1.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        switch lbUnit.text! {
        case "Temperatura":
            calcTemperature()
        case "Peso":
            calcWeight()
        case "Moeda":
            calcCurrency()
        default:
            calcDistance()
        }
        view.endEditing(true)
        let result = Double(lbResult.text!)!
        lbResult.text = String(format: "%.2f", result)
    }
    //tfValue.text! - está extraindo do campo textField a string (pq é string? sempre é string?) e transformando no tipo Double para atribuir esse valor a temperature (que seria o meu optional?). Dúvida: Não poderia dizer de alguma forma na main que é um campo somente de numeros? Se sim, não precisaria converter em Double, somente desembrulhar o optinal (objeto que pode ou não ter um valor definido). Return é necessário pq pode não haver um valor pra esse objeto e consequentemente ele sai dessa função, uma vez que, temperature vai ser usada abaixo, e se não tiver valor, quebra tudo, confere? Ou o guard let sempre tem que ter return?
    func calcTemperature() {
        guard let temperature = Double(tfValue.text ?? "" ) else {return}
        if btUnit1.alpha == 1.0 {
            lbResultUnit.text = "Farenheint"
            lbResult.text = String(temperature * 1.8 + 32.0)
        } else {
            lbResultUnit.text = "Celsius"
            lbResult.text = String((temperature - 32.0) / 1.8)
        }
    }
    func calcWeight() {
        guard let weight = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1.0 {
            lbResultUnit.text = "Libras"
            lbResult.text = String(weight * 2.2046)
        } else {
            lbResultUnit.text = "Quilogramas"
            lbResult.text = String(weight / 2.2046)
        }
    }
    func calcCurrency() {
            guard let currency = Double(tfValue.text!) else {return}
            if btUnit1.alpha == 1.0 {
                lbResultUnit.text = "Dólar"
                lbResult.text = String(currency / 5.15)
            } else {
                lbResultUnit.text = "Real"
                lbResult.text = String(currency * 5.15)
            }
    }
    func calcDistance() {
        guard let distance = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1.0 {
            lbResultUnit.text = "Quilômetro"
            lbResult.text = String(distance / 1000.0)
        } else {
            lbResultUnit.text = "Metros"
            lbResult.text = String(distance * 1000.0)
        }
    }
    
        }
        




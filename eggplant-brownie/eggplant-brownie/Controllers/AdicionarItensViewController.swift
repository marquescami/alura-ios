//
//  AdicionarItensViewController.swift
//  eggplant-brownie
//
//  Created by Camila Marques Vasconcelos Loureiro on 19/01/22.
//

import UIKit

class AdicionarItensViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var caloriasTextField: UITextField!
    
    //MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IBAction
    
    @IBAction func adicionarItem(_ sender: Any) {
        //navegar proxima tela: navigationController.push()
        //voltar para a tela anterior: navigationController.pop()
        
        guard let nome = nomeTextField.text, let calorias = caloriasTextField.text else {
            return
        }
        
        //checando se o numero de calorias pdoe ser convertido para double
        if let numeroDeCalorias = Double (calorias) {
            let item = Item(nome: nome, calorias: numeroDeCalorias)
            navigationController?.popViewController(animated: true)
        }
    }
}

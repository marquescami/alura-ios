//
//  AdicionarItensViewController.swift
//  eggplant-brownie
//
//  Created by Camila Marques Vasconcelos Loureiro on 19/01/22.
//

import UIKit

protocol AdicionaItensDelegate {
    func add(_ item: Item)
}

class AdicionarItensViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var caloriasTextField: UITextField!
    
    //MARK: - Atributos
    var delegate: AdicionaItensDelegate?
    
    init(delegate: AdicionaItensDelegate){
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
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
            
            // como se tivesse um if, so ira para o metodo se existir o delegate - optional chaining, importante tratar o else caso necessario pensando em tratar erros
            delegate?.add(item)
            
            navigationController?.popViewController(animated: true)
        }
    }
}

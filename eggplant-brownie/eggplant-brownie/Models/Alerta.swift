//
//  Alerta.swift
//  eggplant-brownie
//
//  Created by Camila Marques Vasconcelos Loureiro on 24/01/22.
//

import UIKit

class Alerta {
    
    let controller: UIViewController
    
    //init criado recebendo o UIViewController para o uso do present na func exibe
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func exibe(){
        let alerta = UIAlertController(title: "Desculpe", message: "Não foi possível atualizar a tabela", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alerta.addAction(ok)
        controller.present(alerta, animated: true, completion: nil)
    }
}

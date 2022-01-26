//
//  RemoveRefeicaoViewController.swift
//  eggplant-brownie
//
//  Created by Camila Marques Vasconcelos Loureiro on 25/01/22.
//

import UIKit

class RemoveRefeicaoViewController {
    
    let controller: UIViewController
    
    init (controller: UIViewController){
        self.controller = controller
    }
    
    //notacao escaping sinalizando ao metodo que a func sera acionada quando preciso, nesse caso ao apertar e segurar a linha
    func exibe(_ refeicao: Refeicao, handler: @escaping (UIAlertAction) -> Void) {
        
        //controlador de alerta
        let alerta = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)

           
        //criando botões
        let botaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel)
        alerta.addAction(botaoCancelar)
        
        let botaoRemover = UIAlertAction(title: "Remover", style: .destructive, handler: handler)
        
        alerta.addAction(botaoRemover)
        
        controller.present(alerta, animated: true, completion: nil)
    }
}

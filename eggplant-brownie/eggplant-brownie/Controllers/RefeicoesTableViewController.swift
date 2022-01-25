//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Camila Marques Vasconcelos Loureiro on 18/01/22.
//

import UIKit

class RefeicoesTableViewController: UITableViewController, AdicionaRefeicaoDelegate {
    
    var refeicoes = [Refeicao(nome: "Macarrão", felicidade: 4),
                     Refeicao(nome: "Lasanha", felicidade: 5),
                     Refeicao(nome: "Pizza", felicidade: 3)]
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao.nome
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDealhes(_:)))
        
        celula.addGestureRecognizer(longPress)
        
        return celula
    }
    
    func add(_ refeicao: Refeicao){
        refeicoes.append(refeicao)
        
        //atualiza o elemento da lista
        tableView.reloadData()
    }
    
    @objc func mostrarDealhes(_ gesture: UILongPressGestureRecognizer){
        
        if gesture.state == .began {
            let celula = gesture.view as! UITableViewCell
            
            //recuperando objeto pressionado
            guard let indexPath = tableView.indexPath(for: celula) else { return }
            let refeicao = refeicoes[indexPath.row]

            //controlador de alerta
            let alerta = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)

            present(alerta, animated: true, completion: nil)
            
            //criando botões
            let botaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel)
            alerta.addAction(botaoCancelar)
            
            let botaoRemover = UIAlertAction(title: "Remover", style: .destructive, handler: { alerta in //closure
                self.refeicoes.remove(at: indexPath.row)
                self.tableView.reloadData()
            })
            alerta.addAction(botaoRemover)
        }
    }
    
    
    func removeRefeicao(alerta: UIAlertAction){

    }
    
    //metodo usado normalmente para passar informações entre controllers, conversão
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "adicionar" {
            if let viewController = segue.destination as? ViewController {
                viewController.delegate = self
            }
        }
    }
}


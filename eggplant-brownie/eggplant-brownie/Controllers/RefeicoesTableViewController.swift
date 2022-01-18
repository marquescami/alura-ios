//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Camila Marques Vasconcelos Loureiro on 18/01/22.
//

import UIKit

class RefeicoesTableViewController: UITableViewController {
    
    var refeicoes = [Refeicao(nome: "Macarrão", felicidade: 4),
                     Refeicao(nome: "Lasanha", felicidade: 5),
                     Refeicao(nome: "Pizza", felicidade: 3)]
        
    // MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let linha = indexPath.row

        let refeicao = refeicoes[linha]

        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = refeicao.nome

        return cell
    }
    
    func add(_ refeicao: Refeicao){
          refeicoes.append(refeicao)
        
        //atualiza o elemento da lista
        tableView.reloadData()
    }
    
    //metodo usado normalmente para passar informações entre controllers, conversão
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ViewController {
            viewController.tableViewController = self
        }
    }
}


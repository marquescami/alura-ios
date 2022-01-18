//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by Camila Marques Vasconcelos Loureiro on 17/01/22.
//

import UIKit

class Refeicao: NSObject {
    
    // MARK: - Atributos
    
    let nome: String
    let felicidade: Int
    let itens: Array<Item> = []
    
    // MARK: - Init
    
    init(nome: String, felicidade: Int) {
        self.nome = nome
        self.felicidade = felicidade
    }
    
    // MARK: - Metodos
    
    func totalDeCalorias() -> Double {
        var total = 0.0
        
        for item in itens {
            total += item.calorias
        }
        return total
    }
}

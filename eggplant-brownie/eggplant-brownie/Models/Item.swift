//
//  Item.swift
//  eggplant-brownie
//
//  Created by Camila Marques Vasconcelos Loureiro on 17/01/22.
//

import UIKit

class Item: NSObject {
    // MARK: - Atributos
    
    let nome: String
    let calorias: Double
    
    // MARK: - Init
    
    //construtor / inicializador
    init(nome: String, calorias: Double){
        self.nome = nome
        self.calorias = calorias
    }
    
}

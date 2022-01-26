//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Camila Marques Vasconcelos Loureiro on 17/01/22.
//

import UIKit

protocol AdicionaRefeicaoDelegate {
    func add(_ refeicao: Refeicao)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionaItensDelegate {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var ItensTableView: UITableView!
    
    // MARK: - Atributos
    
    var delegate: AdicionaRefeicaoDelegate?
    var itens: [Item] = [Item(nome: "Molho de tomate", calorias: 40.0),
                         Item(nome: "Queijo", calorias: 40.0),
                         Item(nome: "Molho apimentado", calorias: 40.0),
                         Item(nome: "Manjericão", calorias: 40.0)]
    var itensSelecionados: [Item] = []
    
    // MARK: - IBOutlets
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    
    
    
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->
    Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
    UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let linhaDaTabela = indexPath.row
        let item = itens[linhaDaTabela]
        
        celula.textLabel?.text = item.nome
        
        return celula
    }
    
    // MARK: - UITableViewDelegate
    
    //captura de evento de celula (check)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        //extrai optional
        guard let celula = tableView.cellForRow(at: indexPath) else { return }
        
        if celula.accessoryType == .none{
            celula.accessoryType = .checkmark
            let linhaDaTabela = indexPath.row
            itensSelecionados.append(itens[linhaDaTabela]) //adicionando elemento selecionado pelo usuario
        } else {
            celula.accessoryType = .none
            
            //achar posicao do alimento para exclusao
            let item = itens[indexPath.row]
            if let position = itensSelecionados.firstIndex(of: item) {
                itensSelecionados.remove(at: position)
            }
        }
    }
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        let botaoAdicionarItem = UIBarButtonItem(title: "adicionar", style: .plain, target: self, action: #selector(adicionarItens))
        navigationItem.rightBarButtonItem = botaoAdicionarItem
        
        //recuperando dados do arquivo
        
        do {
            guard let diretorio = recuperaDiretorio() else { return}
            let dados = try Data(contentsOf: diretorio)
            let itensSalvos = try
            NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as! [Item]
            
            itens = itensSalvos
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @objc func adicionarItens(){
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    func add(_ item: Item) {
        itens.append(item)
        if let tableView = ItensTableView {
            tableView.reloadData()
        } else {
            Alerta(controller: self).exibe(mensagem: "Erro ao atualizar a tabela")
        }
        
        do{
            let dados = try NSKeyedArchiver.archivedData(withRootObject: itens, requiringSecureCoding: false)
            guard let caminho = recuperaDiretorio() else {return}
            try dados.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func recuperaDiretorio() -> URL? {
        
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        
        let caminho = diretorio.appendingPathComponent("itens")
        
        return caminho
    }
    
    func recuperarRefeicaoDoFormulario() -> Refeicao? {
        guard let nomeDaRefeicao = nomeTextField?.text else {
            return nil
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            return nil
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade)
        refeicao.itens = itensSelecionados
        
        return refeicao
        
    }
    
    
    // MARK: - IBActions
    @IBAction func adicionar(_ sender: Any) {
        
        guard let refeicao = recuperarRefeicaoDoFormulario()else{
            return Alerta(controller: self).exibe(mensagem: "Erro ao ler dados do formulário")}
        delegate?.add(refeicao)
        
        //usando quando desejar voltar para tela anterior no navigation controller
        navigationController?.popViewController(animated: true)
    }
}

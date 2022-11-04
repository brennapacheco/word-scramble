//
//  ViewController.swift
//  WordScramble
//
//  Created by Brenna Pacheco da Silva Alves on 20/10/22.
//

import UIKit

class ViewController: UITableViewController {

    var allWords = [String]()
    var usedWords = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") { //acesso o arquivo dentro do projeto
            if let startWords = try? String(contentsOf: startWordsURL) { //converto pra string o conteudo do arquivo
                allWords = startWords.components(separatedBy: "\n") //atribuo ao array/lista as palavras separadas por um breakline
            }
        }

        if allWords.isEmpty {
            allWords = ["silkworm"] //adiciono uma palavra aleatoria
        }
        startGame()
    }

    func loadFiles() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") { //acesso o arquivo dentro do projeto
            if let startWords = try? String(contentsOf: startWordsURL) { //converto pra string o conteudo do arquivo
                allWords = startWords.components(separatedBy: "\n") //atribuo ao array/lista as palavras separadas por um breakline
            }
        }

        if allWords.isEmpty {
            allWords = ["silkworm"] //adiciono uma palavra aleatoria
        }
    }
    
    func startGame() {
        title = allWords.randomElement() //titulo da pagina com uma palavra aleatoria do array
        usedWords.removeAll(keepingCapacity: true) //remove todos os elementos do array
        tableView.reloadData() //atualiza os dados da tabela
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }
}


//
//  ViewController.swift
//  CodeTest
//
//  Created by Brines, Steve on 2/4/21.
//

import UIKit

class CharactersVC: UIViewController {

    let charactersVM = CharactersVM()
    
    @IBOutlet weak var charactersTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        charactersVM.delegate = self
        charactersVM.getCharacters()
        charactersTV.dataSource = self
    }
}

// MARK: Characters View Model DataSource
extension CharactersVC: CharactersVMDelegate {
    func onSuccessGet(characters: [Character]) {
        for character in characters {
            print(character.name)
        }
        Task{
            charactersTV.reloadData()
        }
    }
    
    func onFailure(error: String) {
        print(error)
    }
}

// MARK: TableView DataSource
extension CharactersVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charactersVM.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let characterCell = charactersTV.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        characterCell.textLabel?.text = charactersVM.characters[indexPath.row].name
        return characterCell
    }
}

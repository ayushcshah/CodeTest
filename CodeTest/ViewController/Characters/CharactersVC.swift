//
//  ViewController.swift
//  CodeTest
//
//  Created by Brines, Steve on 2/4/21.
//

import UIKit

class CharactersVC: UIViewController {
    
    var charactersVM: CharactersVM!
    
    @IBOutlet weak var charactersTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        charactersVM?.delegate = self
        let cellNib = UINib(nibName: CharacterTVC.nibFile, bundle: nil)
        charactersTV.register(cellNib, forCellReuseIdentifier: CharacterTVC.identifier)
        charactersTV.dataSource = self
    }
}

// MARK: Characters View Model DataSource
extension CharactersVC: CharactersVMDelegate {
    func onSuccessGet(characters: [Character]) {
        Task{
            charactersTV.reloadData()
        }
    }
    
    func onFailure(error: String) {
        print(error)
    }
}

// MARK: TableView DataSource and Delegate
extension CharactersVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charactersVM.characters.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = charactersTV.dequeueReusableCell(withIdentifier: CharacterTVC.identifier,
                                                        for: indexPath) as! CharacterTVC
        if (indexPath.row < charactersVM.characters.count) {
            cell.configureCell(with: charactersVM.characters[indexPath.row])
            return cell
        }
        else{
            cell.showLoadingIndicator()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if(indexPath.row == charactersVM.characters.count){
            charactersVM.getCharacters()
        }
    }
    
}

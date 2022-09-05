//
//  ViewController.swift
//  CodeTest
//
//  Created by Brines, Steve on 2/4/21.
//

import UIKit

class CharactersVC: UIViewController {

    let charactersVM = CharactersVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        charactersVM.delegate = self
        charactersVM.getCharacters()
    }
}


extension CharactersVC: CharactersViewDelegate{
    
    func onSuccessGet(characters: [Character]) {
        for character in characters {
            print(character.name)
        }
    }
    
    func onFailure(error: String) {
        print(error)
    }
    
    
}

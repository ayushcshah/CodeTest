//
//  CharactersVM.swift
//  CodeTest
//
//  Created by Ayush Shah on 9/4/22.
//

import Foundation

protocol CharactersVMDelegate: AnyObject {
    func onSuccessGet(characters: [Character]) -> Void
    func onFailure(error: String) -> Void
}

class CharactersVM {
    
    weak var delegate: CharactersVMDelegate?
    let networkRequest = NetworkRequest()
    var characters: [Character] = []
    var offset = 0
    let limit = 100
    var isWaitForResponse = false
    
    init(){
        getCharacters()
    }
    
    func getCharacters() {
        if !isWaitForResponse && offset <= characters.count  {
            isWaitForResponse = true
            networkRequest.getCharacters(withOffset: offset, limit: limit) { [weak self] result in
                self?.isWaitForResponse = false
                switch result {
                case .success(let response):
                    self?.characters += response.Characters
                    self?.offset += response.Characters.count
                    self?.delegate?.onSuccessGet(characters: self?.characters ?? [])
                case .failure(let error):
                    print(error.localizedDescription)
                    self?.delegate?.onFailure(error: error.localizedDescription)
                }
            }
        }
    }
}

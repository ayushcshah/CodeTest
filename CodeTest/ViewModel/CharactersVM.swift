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
    let networkRequest = NetworkRequest.networkRequest
    var characters: [Character] = []
    var offset = 0
    let limit = 100
    
    init(){
        getCharacters()
    }
    
    func getCharacters() {
        networkRequest.getCharacters(withOffset: offset, limit: limit) { [weak self] result in
            switch result {
            case .success(let response):
                self?.characters = response.Characters
                self?.delegate?.onSuccessGet(characters: response.Characters)
            case .failure(let error):
                print(error.localizedDescription)
                self?.delegate?.onFailure(error: error.localizedDescription)
            }
        }
    }
}
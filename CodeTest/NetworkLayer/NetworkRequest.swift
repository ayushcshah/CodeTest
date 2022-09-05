//
//  NetworkRequest.swift
//  CodeTest
//
//  Created by Ayush Shah on 9/4/22.
//

import Foundation

class NetworkRequest{
    
    static let networkRequest = NetworkRequest()
    
    let mainURLstr = "https://www.giantbomb.com/api/"
    let charactersURLstr = "characters/"
    let apiSuccessErrorStr = "OK"
    let apiKeyParams = ["api_key" : "a3c8f1c7ea1ad249deb201014d6b0b852e1399b2",
                        "format":"json"]
    
    
    func getCharacters(withOffset offset: Int,
                     limit: Int,
                     optionalParams: [String:String] = [:],
                     completion:@escaping (Result<CharactersResponse, Error>) -> ()) {
        
        let component = URLComponents(string: mainURLstr + charactersURLstr)
        guard var component = component else {
            completion(.failure(CTError.invalidURL))
            return
        }
        var charactersParams = ["limit":String(limit),
                                "offset":String(offset)]
        
        for (key, value) in optionalParams {
            charactersParams[key] = value
        }
        for (key, value) in apiKeyParams {
            charactersParams[key] = value
        }
        component.setQueryItems(with: charactersParams)

        guard let url = component.url else {
            print("Invalid url...")
            completion(.failure(CTError.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in

            let errorValidation = self?.checkResponseForError(data: data,
                                                             response: response,
                                                             error: error)
            if let errorValidation = errorValidation {
                completion(.failure(errorValidation))
                return
            }
            
            guard let data = data else {
                completion(.failure(CTError.dataNotFound))
                return
            }
            do {
                let response = try JSONDecoder().decode(CharactersResponse.self, from: data)
                    completion(.success(response))
            } catch{
                completion(.failure(CTError.keyNotFound))
            }
        }.resume()
    }
    
    func checkResponseForError(data: Data?,
                               response:URLResponse?,
                               error:Error?) -> Error?{
        
        if let error = error {
            return error
        }
        if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
            return CTError.serverError(statusCode: response.statusCode)
        }
        if data == nil {
            return CTError.dataNotFound
        }
        return nil
    }
}

// MARK: URLCompents Extension
extension URLComponents {
    mutating func setQueryItems(with parameters: [String: String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}

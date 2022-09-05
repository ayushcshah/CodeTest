//
//  CTImageView.swift
//  CodeTest
//
//  Created by Ayush Shah on 9/5/22.
//

import UIKit

class CTImageView: UIImageView {

    let loadingIndicator = UIActivityIndicatorView(style: .medium)
    let networkRequest = NetworkRequest()
    
    func loadImageFrom(URL strUrl:String,
                       defaultImage: UIImage = UIImage(named: "profilePicture")!) -> () {
        guard let url = URL(string: strUrl) else {
            image = defaultImage
            return
        }
        
        image = nil
        addLoadingIndicator()
        networkRequest.getImage(from: url) { [weak self]result in
            switch result{
            case .success(let data):
                self?.set(image: UIImage(data: data) ?? defaultImage)
                self?.removeLoadingIndicator()
                break

            case .failure(let error):
                switch error {
                case CTError.dataNotFound: break
                default:
                    print(error.localizedDescription)
                    self?.set(image: defaultImage)
                    self?.removeLoadingIndicator()
                }
                break
            }
        }
    }
    
    func set(image: UIImage){
        Task {
            self.image = image
        }
    }
    
    func addLoadingIndicator() {
        addSubview(loadingIndicator)
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        loadingIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        loadingIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loadingIndicator.startAnimating()
    }
    
    func removeLoadingIndicator(){
        Task{
            loadingIndicator.removeFromSuperview()
        }
    }
}

//
//  CharacterTVC.swift
//  CodeTest
//
//  Created by Ayush Shah on 9/5/22.
//

import UIKit

class CharacterTVC: UITableViewCell {
    
    static let identifier = "CharacterTVCId"
    static let nibFile = "CharacterTVC"
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var ivDisplayPicture: CTImageView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func showLoadingIndicator(){
        lblName.text = NSLocalizedString("loading", comment: "")
        ivDisplayPicture.set(image: UIImage(named: "profilePicture")!)
        loadingIndicator.startAnimating()
    }
    
    func configureCell(with character: Character) {
        loadingIndicator.stopAnimating()
        lblName.text = character.name
        ivDisplayPicture.loadImageFrom(URL: character.image.mediumURL)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

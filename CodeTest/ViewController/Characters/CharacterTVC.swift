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
    @IBOutlet weak var ivDisplayPicture: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(with character: Character) {
        lblName.text = character.name
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

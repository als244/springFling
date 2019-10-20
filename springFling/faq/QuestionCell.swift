//
//  QuestionCell.swift
//  YaleSpringFling
//
//  Created by Andrew Sheinberg on 9/22/19.
//

import UIKit

class QuestionCell: UITableViewCell {

    @IBOutlet weak var questionLabel: UILabel!
    
    
    
    @IBOutlet weak var carrot: UIImageView!
    func setQuestion(question : String){
        questionLabel.text = question
    }
    
    func setCarrot(carrot_type : String){
        carrot.image = UIImage(named: carrot_type)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

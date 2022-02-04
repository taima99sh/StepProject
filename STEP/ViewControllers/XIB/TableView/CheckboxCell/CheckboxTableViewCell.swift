//
//  CheckboxTableViewCell.swift
//  STEP
//
//  Created by taima shrafi on 03/01/2022.
//

import UIKit
import BEMCheckBox

struct City {
    let name: String
    var isSelected: Bool
}


class CheckboxTableViewCell: GeneralTableViewCell {

    @IBOutlet weak var checkBox: BEMCheckBox!
    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    override func configureCell() {
        if let obj = self.object?.object as? CategoryList {
            self.checkBox.on = obj.isSelected
            self.lblName.text = obj.name
        }
        
        if let obj = self.object?.object as? City {
            self.checkBox.on = obj.isSelected
            self.lblName.text = obj.name
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

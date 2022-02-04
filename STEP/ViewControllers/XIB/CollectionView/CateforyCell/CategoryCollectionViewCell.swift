//
//  CategoryCollectionViewCell.swift
//  STEP
//
//  Created by taima shrafi on 15/12/2021.
//

import UIKit

struct CategoryList {
    var img: String = ""
    var name: String = ""
    var isSelected: Bool
}

class CategoryCollectionViewCell: GeneralCollectionViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var viewBackground: UIView!
    
            
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func configureCell() {
//        if let parentVC = self.parentVC {
//        }
        
        if let obj = self.object?.object as? CategoryList {
            self.imgView.image = obj.img.image_
            self.lblName.text = obj.name
            
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.viewBackground.backgroundColor = "#E1F5E7".color_
        self.viewBackground.borderWidth = 3
        if let parent = parentVC {
            guard parent.restorationIdentifier == "CategoriesViewController" else {return}
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "EventsListViewController") as! EventsListViewController
            parent.navigationController?.pushViewController(vc, animated: true)
        }
    }
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        self.viewBackground.backgroundColor = .white
        self.viewBackground.borderWidth = 0.5
    }

}


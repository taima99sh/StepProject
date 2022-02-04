//
//  HomeCollectionViewCell.swift
//  STEP
//
//  Created by taima shrafi on 12/12/2021.
//

import UIKit

struct EventData {
    var img: String = ""
    var name: String = ""
    var owner: String = ""
    var date: String = ""
}


class HomeCollectionViewCell: GeneralCollectionViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblOwner: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func configureCell() {
        if let obj = self.object?.object as? EventData {
            let randomInt = Int.random(in: 1..<4)
            //self.imgView.image = obj.img.image_
            self.imgView.image = "\(randomInt)".image_
            self.lblName.text = obj.name
            self.lblOwner.text = obj.owner
            self.lblDate.text = obj.date
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "EventViewController") as! EventViewController // change it to event screen
        if let parent = parentVC {
            parent.navigationController?.pushViewController(vc, animated: true)
        }
//        if let obj = self.object?.object as? EventData {
//        }
//        AppDelegate.shared.rootNavigationViewController.pushViewController(vc, animated: false)
    }

    

}

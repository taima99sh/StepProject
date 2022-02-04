//
//  Constant.swift
//  STEP
//
//  Created by taima shrafi on 14/10/2021.
//

import Foundation
import SVProgressHUD

class Constant {
    static let shared = Constant()
    var categories: [Category] = []
    var ProjectFont = "Helvetica Neue W23 for SKY"
    
    class func showLoader(isShowLoader: Bool) {
        if isShowLoader {
            SVProgressHUD.setDefaultMaskType(.custom)
            SVProgressHUD.setForegroundColor("1E92C4".color_)
            SVProgressHUD.setBackgroundColor(UIColor.white)
            SVProgressHUD.show()
        } else {
            SVProgressHUD.dismiss()
        }
    }
}

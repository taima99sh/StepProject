//
//  TabBarController.swift
//  STEP
//
//  Created by taima shrafi on 02/01/2022.
//

import UIKit
import LGSideMenuController

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    

    

}

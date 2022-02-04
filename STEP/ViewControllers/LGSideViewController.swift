//
//  LGSideViewController.swift
//  STEP
//
//  Created by taima shrafi on 02/01/2022.
//

import UIKit
import LGSideMenuController

class LGSideViewController: LGSideMenuController {
    
    let rootVC = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
    
    let rightVC = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        localized()
        setupData()
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        setupView()
    }
    
    @IBAction func btnMenu(_ sender: Any) {
        self.toggleRightViewAnimated(self)
    }
    
}

extension LGSideViewController {
    
    func setupView() {
        AppDelegate.shared.rootViewController = self
        self.rootViewController = self.rootVC
        self.rightViewController = self.rightVC
        self.rightViewWidth = 250
    }
     
    func localized() {
    }
    
    func setupData() {
    }
    
    func fetchData() {
    }
}

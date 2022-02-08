

import UIKit

class MainNavigationViewController: UINavigationController {
    


    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        localized()
        setupData()
        fetchData()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    

}

extension MainNavigationViewController {
    func setupView(){
        AppDelegate.shared.rootNavigationViewController = self
        if UserProfile.shared.isUserLogin() {
            let type = UserProfile.shared.userType
            let vc = type == 0 ? UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "HomeViewController")as! HomeViewController : UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "LGSideViewController") as! LGSideViewController
            AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
            return
        }
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
    }
    func localized(){}
    func setupData(){}
    func fetchData(){}

}

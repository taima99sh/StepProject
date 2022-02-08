

import UIKit

class LoginViewController: UIViewController {
    


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
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        self.showIndicator()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.hideIndicator()
            UserProfile.shared.userID = 1
            self.SuccessMessage(title: "", successbody: "تم تسجيل الدخول بنجاح")
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "LGSideViewController") as! LGSideViewController
            AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
        }
    }
    
}

extension LoginViewController {
    func setupView(){}
    func localized(){}
    func setupData(){}
    func fetchData(){}

}

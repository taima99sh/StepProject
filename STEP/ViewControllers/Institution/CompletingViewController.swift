

import UIKit

class CompletingViewController: UIViewController {
    


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
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    @IBAction func btnBackToHome(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "LGSideViewController") as! LGSideViewController
        AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    

}

extension CompletingViewController {
    func setupView(){}
    func localized(){}
    func setupData(){}
    func fetchData(){}

}

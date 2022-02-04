

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
    }
    

}

extension CompletingViewController {
    func setupView(){}
    func localized(){}
    func setupData(){}
    func fetchData(){}

}

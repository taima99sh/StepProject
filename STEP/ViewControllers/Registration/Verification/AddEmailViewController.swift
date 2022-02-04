

import UIKit

class AddEmailViewController: UIViewController {
    


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
    

}

extension AddEmailViewController {
    func setupView(){}
    func localized(){}
    func setupData(){}
    func fetchData(){}

}



import UIKit

class AboutUsViewController: UIViewController {
    


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

extension AboutUsViewController {
    func setupView(){}
    func localized(){}
    func setupData(){}
    func fetchData(){}

}



import UIKit

class VerificationViewController: UIViewController {
    
    
    @IBOutlet weak var txtCode: UITextField!
    
    @IBOutlet weak var btnDone: UIButton!
    
    @IBOutlet weak var btnResend: UIButton!
    

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
    
    @IBAction func btnDone(_ sender: Any) {
        print("*******************************")
        print(txtCode.text)
    }
    
}

extension VerificationViewController {
    func setupView(){
    }
    func localized(){}
    func setupData(){}
    func fetchData(){}

}

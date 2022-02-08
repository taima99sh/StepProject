

import UIKit

class EventViewController: UIViewController {
    

    @IBOutlet weak var eventImgView: UIImageView!
    @IBOutlet weak var lblEventName: UILabel!
    @IBOutlet weak var lblEventCategory: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblOwner: UILabel!
    @IBOutlet weak var btnOwner: UIButton!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblOnOff: UILabel!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var lblIsAvailable: UILabel!
    
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
//        self.navigationController?.navigationBar.backgroundColor = .clear
//        self.navigationController?.setNavigationBarHidden(false, animated: false)
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//            navigationController?.navigationBar.shadowImage = UIImage()
//            navigationController?.navigationBar.isTranslucent = true
        

    }
    
    @IBAction func btnEdit(_ sender: Any) {
        
    }
    
}

extension EventViewController {
    func setupView(){
        self.btnEdit.isHidden = false
        self.lblIsAvailable.isHidden = true
    }
    func localized(){}
    func setupData(){}
    func fetchData(){}

}

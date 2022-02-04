

import UIKit
import DropDown

class StudentRegisterViewController: UIViewController {
    
    @IBOutlet weak var btnShowCities: UIButton!
    
    @IBOutlet weak var txtCity: UITextField!
    var citiesArr: [City] = [
                             City(name: "غزة", isSelected: false),
                             City(name: "خانيونس", isSelected: false),
                             City(name: "رفح", isSelected: false),
                             City(name: "رام الله", isSelected: false),
                             City(name: "الخليل", isSelected: false),
                             City(name: "نابلس", isSelected: false),
                             City(name: "أريحا", isSelected: false),
                             City(name: "القدس", isSelected: false),
                             City(name: "البيرة", isSelected: false),]
    
    let citiesDropDown = DropDown()

    


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
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func btnShowCities(_ sender: Any) {
        citiesDropDown.show()
    }
    
    @IBAction func btnNext(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "InterestedFieldsViewController") as! InterestedFieldsViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func setupCitiesDropDown() {
        citiesDropDown.anchorView = btnShowCities
        citiesDropDown.bottomOffset = CGPoint(x: 0, y: btnShowCities.bounds.height)
        citiesDropDown.textFont = Constant.shared.ProjectFont.toFont() ?? UIFont(name: "Arial", size: 14)!
        //categoryDropDown.tableView.h
        
        citiesDropDown.dataSource =  citiesArr.map{$0.name }
        // Action triggered on selection
        citiesDropDown.cancelAction = {}
        citiesDropDown.selectionAction = { [weak self] (index, item) in
            if let wself = self {
                wself.txtCity.text = item
            }
        }
    }
    
}

extension StudentRegisterViewController {
    func setupView(){
        setupCitiesDropDown()
    }
    func localized(){}
    func setupData(){}
    func fetchData(){}

}

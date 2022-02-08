

import UIKit
import DropDown

class InstitutionRegisterViewController: UIViewController {
    
    @IBOutlet weak var btnShowCategories: UIButton!
    @IBOutlet weak var txtCategory: UITextField!
    
    let categoryDropDown = DropDown()
    var categoryListArr: [CategoryList] = [CategoryList(img: "design-icon", name: "الكل", isSelected: true),
        CategoryList(img: "design-icon", name: "التصميم الجرافيكي", isSelected: false),
                                           CategoryList(img: "development-icon", name: "البرمجة", isSelected: false),
                                           CategoryList(img: "marketing-icon", name: "التسويق", isSelected: false),
                                           CategoryList(img: "business-icon", name: "تجارة", isSelected: false),
                                           CategoryList(img: "artIcon", name: "الرسم", isSelected: false),
                                           CategoryList(img: "worker", name: "الهندسة", isSelected: false),
                                           CategoryList(img: "language", name: "الترجمة", isSelected: false),
                                           CategoryList(img: "medicine", name: "الطب", isSelected: false),
                                           CategoryList(img: "videography-icon", name: "أفلام", isSelected: false),
                                           CategoryList(img: "music-icon", name: "الموسيقى", isSelected: false),
                                           CategoryList(img: "photography-icon", name: "التصوير", isSelected: false),
                                           CategoryList(img: "thinking", name: "المهارات الشخصية", isSelected: false)]

    

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
    
    
    @IBAction func btnSowCategories(_ sender: Any) {
        categoryDropDown.show()

    }
    
    @IBAction func btnRegister(_ sender: Any) {
        self.showIndicator()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.hideIndicator()
            UserProfile.shared.userID = 1
            self.SuccessMessage(title: "", successbody: "تم إنشاء الحساب بنجاح")
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "LGSideViewController") as! LGSideViewController
            AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
        }
    }
    
    func setupCategoryDropDown() {
        categoryDropDown.anchorView = btnShowCategories
        categoryDropDown.bottomOffset = CGPoint(x: 0, y: btnShowCategories.bounds.height)
        categoryDropDown.textFont = Constant.shared.ProjectFont.toFont() ?? UIFont(name: "Arial", size: 14)!
        //categoryDropDown.tableView.h
        
        categoryDropDown.dataSource =  categoryListArr.map{$0.name }
        // Action triggered on selection
        categoryDropDown.cancelAction = {}
        categoryDropDown.selectionAction = { [weak self] (index, item) in
            if let wself = self {
                wself.txtCategory.text = item
            }
        }
    }
    
}

extension InstitutionRegisterViewController {
    func setupView(){
        setupCategoryDropDown()
    }
    func localized(){}
    func setupData(){}
    func fetchData(){}

}

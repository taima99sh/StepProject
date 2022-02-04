//
//  FilterViewController.swift
//  STEP
//
//  Created by taima shrafi on 24/11/2021.
//

import UIKit
import TTRangeSlider
import DropDown


class FilterViewController: UIViewController {

    @IBOutlet weak var txtKeyWords: UITextField!
    @IBOutlet weak var txtCategory: UITextField!
    @IBOutlet weak var sliderAge: TTRangeSlider!
    @IBOutlet weak var lblMaxAge: UILabel!
    @IBOutlet weak var lblMinAge: UILabel!
    @IBOutlet weak var txtInstitution: UITextField!
    //@IBOutlet weak var institutionCollectionView: UICollectionView!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var btnDate: UIButton!
    //@IBOutlet weak var lblDate1: UILabel!
    //@IBOutlet weak var lblDate2: UILabel!
    @IBOutlet weak var btnFilter: UIButton!
    @IBOutlet weak var btnShowCategories: UIButton!
    @IBOutlet weak var btnShowInstitution: UIButton!
    @IBOutlet weak var btnChooseCity: UIButton!
    @IBOutlet weak var imgCategoriesArrow: UIImageView!
    @IBOutlet weak var imginstutionsArrow: UIImageView!
    @IBOutlet weak var imgCitiesArrow: UIImageView!
    @IBOutlet weak var stackDate: UIStackView!
    @IBOutlet weak var citiesTableView: GeneralTableView!
    @IBOutlet weak var categoriesTableView: GeneralTableView!
    
    var isShowDate = false
    var isShowCategories = false
    var isShowInstitutions = false
    var isShowCities = false
    
    var categoryDropDown = DropDown()
    let institutionDropDown = DropDown()
    var citiesArr: [City] = [City(name: "الكل", isSelected: true),
                             City(name: "غزة", isSelected: false),
                             City(name: "خانيونس", isSelected: false),
                             City(name: "رفح", isSelected: false),
                             City(name: "رام الله", isSelected: false),
                             City(name: "الخليل", isSelected: false),
                             City(name: "نابلس", isSelected: false),
                             City(name: "أريحا", isSelected: false),
                             City(name: "القدس", isSelected: false),
                             City(name: "البيرة", isSelected: false),]
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
    
    var institutionsArr: [String] = ["الكل", "جامعة فلسطين", "خطوة", "معهد السلام" , "استديو لحظة", "جامعة الأزهر", "غزة سكاي جيكس" ,"الحامعة الاسلامية " ,"أيام المسرح ", "مركز رشاد الشوا", "مركز شباب غزة"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
        fetchData()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AppDelegate.shared.rootViewController.navigationItem.title = "البحث"
    }
    
    @IBAction func btnFilter(_ sender: Any) {
        
    }
    
    @IBAction func btnDate(_ sender: Any) {
        self.stackDate.isHidden = isShowDate ? true : false
        isShowDate = !isShowDate
    }
    @IBAction func btnShowCategories(_ sender: Any) {
        if self.isShowCategories {
            self.imgCategoriesArrow.image = UIImage(systemName: "chevron.down")
            UIView.transition(with: categoriesTableView, duration: 0.4,
                              options: .transitionCrossDissolve,
                              animations: {
                self.categoriesTableView.isHidden = true
                          })
            
            isShowCategories = !isShowCategories
            return
        }
        self.imgCategoriesArrow.image = UIImage(systemName: "chevron.up")
        UIView.transition(with: categoriesTableView, duration: 0.4,
                          options: .transitionCrossDissolve,
                          animations: {
            self.categoriesTableView.isHidden = false
                      })
        
        isShowCategories = !isShowCategories
    }
    @IBAction func btnShowInstitution(_ sender: Any) {
        self.imginstutionsArrow.image = self.isShowInstitutions ? UIImage(systemName: "chevron.down"): UIImage(systemName: "chevron.up")
        isShowInstitutions = !isShowInstitutions
        institutionDropDown.show()
    }
    
    @IBAction func btnChooseCity(_ sender: Any) {
        if self.isShowCities {
            self.imgCitiesArrow.image = UIImage(systemName: "chevron.down")
            UIView.transition(with: citiesTableView, duration: 0.4,
                              options: .transitionCrossDissolve,
                              animations: {
                self.citiesTableView.isHidden = true
                          })
           
            isShowCities = !isShowCities
            return
        }
        self.imgCitiesArrow.image = UIImage(systemName: "chevron.up")
        UIView.transition(with: citiesTableView, duration: 0.4,
                          options: .transitionCrossDissolve,
                          animations: {
            self.citiesTableView.isHidden = false
                      })
        
        isShowCities = !isShowCities
    }
    
    @IBAction func btnSlider(_ sender: Any) {
        self.lblMinAge.text = String(format: "%.0f", Double(sliderAge.selectedMinimum))
        self.lblMaxAge.text = String(format: "%.0f", Double(sliderAge.selectedMaximum))
    }
    
    
    
    
    
    
    
    
    func setupCategoryDropDown() {
        categoryDropDown.anchorView = btnShowCategories
        categoryDropDown.bottomOffset = CGPoint(x: 0, y: btnShowCategories.bounds.height)
        categoryDropDown.textFont = Constant.shared.ProjectFont.toFont() ?? UIFont(name: "Arial", size: 14)!
        
        categoryDropDown.dataSource =  categoryListArr.map{$0.name }
        // Action triggered on selection
        categoryDropDown.cancelAction = {
            self.imgCategoriesArrow.image = UIImage(systemName: "chevron.down")
            self.isShowCategories = !self.isShowCategories
        }
        categoryDropDown.selectionAction = { [weak self] (index, item) in
            if let wself = self {
                wself.imgCategoriesArrow.image = UIImage(systemName: "chevron.down")
                wself.isShowCategories = !(wself.isShowCategories)
            }
        }
    }
    func setupInstitutionDropDown() {
        institutionDropDown.anchorView = btnShowInstitution
        institutionDropDown.bottomOffset = CGPoint(x: 0, y: btnShowInstitution.bounds.height)
        institutionDropDown.textFont = Constant.shared.ProjectFont.toFont() ?? UIFont(name: "Arial", size: 14)!
        institutionDropDown.dataSource = self.institutionsArr
        institutionDropDown.cancelAction = {
            self.imginstutionsArrow.image = UIImage(systemName: "chevron.down")
            self.isShowInstitutions = !self.isShowInstitutions
        }
        // Action triggered on selection
        institutionDropDown.selectionAction = { [weak self] (index, item) in
            if let wself = self {
                wself.imginstutionsArrow.image = UIImage(systemName: "chevron.down")
                wself.isShowInstitutions = !(wself.isShowInstitutions)
            }
        }
    }

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension FilterViewController {
    func setupView() {
        self.citiesTableView.isHidden = true
        self.categoriesTableView.isHidden = true
        self.citiesTableView.register(UINib(nibName: "CheckboxTableViewCell", bundle: nil), forCellReuseIdentifier: "CheckboxTableViewCell")
        self.citiesTableView.isSelfSize = true
        self.categoriesTableView.register(UINib(nibName: "CheckboxTableViewCell", bundle: nil), forCellReuseIdentifier: "CheckboxTableViewCell")
        self.categoriesTableView.isSelfSize = true
        self.stackDate.isHidden = true
        //self.setupCategoryDropDown()
        setupInstitutionDropDown()
    }
    func setupData() {
        //citiesTableView.EmptyDataTitle = ""
        for obj in citiesArr {
            citiesTableView.objects.append(GeneralTableViewData(identifier: "CheckboxTableViewCell", object: obj, rowHeight: nil))
        }
        for obj in categoryListArr {
            categoriesTableView.objects.append(GeneralTableViewData(identifier: "CheckboxTableViewCell", object: obj, rowHeight: nil))
        }
    }
    func fetchData() {}
}

//extension FilterViewController: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        10
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        UICollectionViewCell()
//    }
//}







import UIKit



class InterestedFieldsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: GeneralCollectionView!
    
    
    var categoryListArr: [CategoryList] = [CategoryList(img: "design-icon", name: "التصميم الجرافيكي", isSelected: false),
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
        self.navigationController?.navigationBar.isHidden = false
        collectionView.reloadData()
        //setupData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //collectionView.reloadData()
    }
    
    @IBAction func btnDone(_ sender: Any) {
        print("______________________________________")
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

extension InterestedFieldsViewController {
    func setupView(){
        collectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
    }
    func localized(){}
    func setupData(){
        collectionView.allowsMultipleSelection = true
        // collectionView.frame.size.width
        let width = (view.frame.size.width - (40)) / 3
        for obj in categoryListArr {
            collectionView.objects.append(GeneralCollectionViewData(identifier: "CategoryCollectionViewCell", object: obj, cellSize: CGSize.init(width: width, height: width)))
        }
    }
    func fetchData(){}
}


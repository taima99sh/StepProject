

import UIKit


class CategoriesViewController: UIViewController {
    
    @IBOutlet weak var collectionView: GeneralCollectionView!
    @IBOutlet weak var lblTitle: UILabel!
    
    var titleValue: String = "التصنيفات"
    
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
        self.navigationController?.navigationBar.isHidden = true
        //setupData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.reloadData()
    }
}

extension CategoriesViewController {
    func setupView(){
        collectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
    }
    func localized(){}
    func setupData(){
//        if let navController = self.navigationController, navController.viewControllers.count >= 2 {
//             let viewController = navController.viewControllers[navController.viewControllers.count - 2]
//            self.stackViewDone.isHidden = viewController.restorationIdentifier == "StudentRegisterViewController" ? false : true
//        }

        let width = (view.frame.size.width - (40)) / 3
        for obj in categoryListArr {
            collectionView.objects.append(GeneralCollectionViewData(identifier: "CategoryCollectionViewCell", object: obj, cellSize: CGSize.init(width: width, height: width)))
        }
    }
    func fetchData(){}
}




import UIKit
import YPImagePicker
import DropDown
import SkyFloatingLabelTextField
import BEMCheckBox

class AddEventViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnAddImage: UIButton!
    @IBOutlet weak var btnChangeImage: UIButton!
    @IBOutlet weak var btnShowCategories: UIButton!
    @IBOutlet weak var btnShowCities: UIButton!
    @IBOutlet weak var txtDate: SkyFloatingLabelTextField!
    @IBOutlet weak var txtCategory: SkyFloatingLabelTextField!
    @IBOutlet weak var txtCity: SkyFloatingLabelTextField!
    
    @IBOutlet weak var viewCity: UIView!
    @IBOutlet weak var txtAddress: SkyFloatingLabelTextField!
    @IBOutlet weak var txtLink: SkyFloatingLabelTextField!
    @IBOutlet weak var txtTrainer: SkyFloatingLabelTextField!
    @IBOutlet weak var txtDetails: SkyFloatingLabelTextField!
    @IBOutlet weak var offlineCheckBox: BEMCheckBox!
    @IBOutlet weak var onlineCheckBox: BEMCheckBox!
    @IBOutlet weak var txtName: SkyFloatingLabelTextField!
    var citiesDropDown = DropDown()
    let categoryDropDown = DropDown()
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
    
    
    lazy var picker: YPImagePicker = {
        
        
            var config = YPImagePickerConfiguration()
            config.isScrollToChangeModesEnabled = true
            config.onlySquareImagesFromCamera = true
            config.usesFrontCamera = false
            config.showsPhotoFilters = true
            config.shouldSaveNewPicturesToAlbum = true
            config.albumName = "DefaultYPImagePickerAlbumName"
            config.startOnScreen = YPPickerScreen.photo
            config.screens = [.library, .photo]
            config.showsCrop = .none
            config.targetImageSize = YPImageSize.original
            config.overlayView = UIView()
            config.hidesStatusBar = true
            config.hidesBottomBar = false
            config.preferredStatusBarStyle = UIStatusBarStyle.default
            
            config.library.options = nil
            config.library.onlySquare = false
            config.library.minWidthForItem = nil
            config.library.mediaType = YPlibraryMediaType.photo
            config.library.maxNumberOfItems = 1
            config.library.minNumberOfItems = 1
            config.library.numberOfItemsInRow = 4
            config.library.spacingBetweenItems = 1.0
            config.library.skipSelectionsGallery = true
            
//            config.video.compression = AVAssetExportPresetHighestQuality
            config.video.fileType = .mov
            config.video.recordingTimeLimit = 60.0
            config.video.libraryTimeLimit = 60.0
            config.video.minimumTimeLimit = 3.0
            config.video.trimmerMaxDuration = 60.0
            config.video.trimmerMinDuration = 3.0
            
            return YPImagePicker(configuration: config)
        }()
    

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
    
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
    }
    
    @IBAction func btnCategories (_ sender: Any) {
        categoryDropDown.show()
    }
    
    @IBAction func btnOnline(_ sender: Any) {
    }
    
    
    @IBAction func btnShowCities(_ sender: Any) {
        citiesDropDown.show()
    }
    @IBAction func btnTimeDate(_ sender: Any) {
        
    }
    
    @IBAction func btnCancel(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnPublish(_ sender: Any) {
    }
    
    @IBAction func btnOffline(_ sender: Any) {
        if self.offlineCheckBox.on {
            UIView.transition(with: txtAddress, duration: 0.4,
                              options: .transitionCrossDissolve,
                              animations: {
                self.txtAddress.isHidden = false
                //self.viewCity.isHidden = false
                          })
            UIView.transition(with: viewCity, duration: 0.4,
                              options: .transitionCrossDissolve,
                              animations: {
                //self.txtAddress.isHidden = false
                self.viewCity.isHidden = false
                          })
            
            return
        }
        UIView.transition(with: txtAddress, duration: 0.4,
                          options: .transitionCrossDissolve,
                          animations: {
            self.txtAddress.isHidden = true
            self.viewCity.isHidden = true
                      })
        
        UIView.transition(with: viewCity, duration: 0.4,
                          options: .transitionCrossDissolve,
                          animations: {
            //self.txtAddress.isHidden = false
            self.viewCity.isHidden = true
                      })
        
    }
    
    @IBAction func btnAddImage(_ sender: Any) {
        
        picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto {
                print(photo.fromCamera) // Image source (camera or library)
                print(photo.image) // Final image selected by the user
                print(photo.originalImage) // original image selected by the user, unfiltered
                print(photo.modifiedImage) // Transformed image, can be nil
                print(photo.exifMeta) // Print exif meta data of original image.
                self.imgView.isHidden = false
                self.btnChangeImage.isHidden = false
                self.btnAddImage.isHidden = true
                self.imgView.image = photo.image
            }
            picker.dismiss(animated: true, completion: nil)

            }
            present(picker, animated: true, completion: nil)
        }
    
    @IBAction func btnChangeImage(_ sender: Any) {
        self.btnAddImage(self)
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

extension AddEventViewController {
    func setupView(){
        self.txtAddress.isHidden = true
        self.viewCity.isHidden = true
        self.imgView.isHidden = true
        self.btnChangeImage.isHidden = true
        setupCategoryDropDown()
        setupCitiesDropDown()
        self.txtName.titleFont = Constant.shared.ProjectFont.toFont(size: 13)!
        self.txtDate.titleFont = Constant.shared.ProjectFont.toFont(size: 13)!
        self.txtCategory.titleFont = Constant.shared.ProjectFont.toFont(size: 13)!
        self.txtCity.titleFont = Constant.shared.ProjectFont.toFont(size: 13)!
        self.txtLink.titleFont = Constant.shared.ProjectFont.toFont(size: 13)!
        self.txtDetails.titleFont = Constant.shared.ProjectFont.toFont(size: 13)!
        self.txtTrainer.titleFont = Constant.shared.ProjectFont.toFont(size: 13)!
        self.txtAddress.titleFont = Constant.shared.ProjectFont.toFont(size: 13)!
        
    }
    func localized(){}
    func setupData(){}
    func fetchData(){}

}


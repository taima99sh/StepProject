

import UIKit
import LGSideMenuController
import SCLAlertView
class MenuViewController: UIViewController {
    
    
    let appearance = SCLAlertView.SCLAppearance(
        kTitleFont: Constant.shared.ProjectFont.toFont() ?? UIFont(),
        kTextFont: Constant.shared.ProjectFont.toFont()!,
        kButtonFont: Constant.shared.ProjectFont.toFont()!,
        showCloseButton: true,
        circleBackgroundColor: "#248277".color_ ,
        contentViewBorderColor: "#248277".color_
        
        //contentViewColor: "".myColor
    )
    


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
        sideMenuController?.isRightViewSwipeGestureEnabled = true
        //AppDelegate.shared.rootViewController.navigationItem.title = ""
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func btnLogOut(_ sender: Any) {
        self.showAlert(title: "", message: "هل تريد تسجيل الخروج؟") {
            print("تسجيل الخروج")
        } button2action: {
            print("إلغاء")
        }
    }
    
    @IBAction func btnShareApp(_ sender: Any) {
        if let urlStr = NSURL(string: "https://apps.apple.com/us/app/facebook/id284882215") {
            let objectsToShare = [urlStr]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.excludedActivityTypes = [.postToFacebook, .postToTwitter, .mail]
            activityVC.view.tintColor = "#248277".color_
            if UIDevice.current.userInterfaceIdiom == .pad {
                if let popup = activityVC.popoverPresentationController {
                    popup.sourceView = self.view
                    popup.sourceRect = CGRect(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 4, width: 0, height: 0)
                }
            }
            self.present(activityVC, animated: true, completion: nil)
        }
    }
}

extension MenuViewController {
    func setupView(){}
    func localized(){}
    func setupData(){}
    func fetchData(){}

}

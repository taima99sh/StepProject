

import UIKit

class StudentProfileViewController: UIViewController {
    
    
    enum typePage: String {
        case interested
        case following
    }

    var interestedVC: EventsListViewController!
    var followingVC: InstitutionListViewController!

    var type: typePage = .interested {
        didSet {
            updateGUI()
        }
    }

    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var lblInterestedNum: UILabel!
    @IBOutlet weak var lblFollowingNum: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var lblInterested: UILabel!
    @IBOutlet weak var lblFollowing: UILabel!
    @IBOutlet weak var btnInterested: UIButton!
    @IBOutlet weak var btnFollowing: UIButton!
    @IBOutlet weak var lineInterested: UIView!
    @IBOutlet weak var lineFollowing: UIView!
    
    
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.imgProfile.cornerRadius = self.imgProfile.frame.size.height / 2
    }
    
    @IBAction func btnEdit(_ sender: Any) {
    }
    
    @IBAction func btnInterested(_ sender: Any) {
        self.type = .interested
    }
    @IBAction func btnFollowing(_ sender: Any) {
        self.type = .following
    }
    
}

extension StudentProfileViewController {
    func setupView(){}
    func localized(){}
    func setupData(){
        self.interestedVC = (UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "EventsListViewController") as! EventsListViewController)
        self.followingVC = (UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "InstitutionListViewController") as! InstitutionListViewController)
        self.addChild(interestedVC)
        self.addChild(followingVC)

        self.type = .following
    }
    func fetchData(){}
    func updateGUI(){
        switch self.type {
            
        case .interested:
            self.lineInterested.backgroundColor = "#248277".color_
            self.lineFollowing.backgroundColor = "#EEEEEE".color_
            self.btnFollowing.isEnabled = true
            self.btnInterested.isEnabled = false
            
            self.lblInterestedNum.backgroundColor = "#248277".color_
            self.lblFollowingNum.backgroundColor = "#969696".color_

            self.lblInterested.textColor = "#248277".color_
            self.lblFollowing.textColor = "#969696".color_
            
            //
            for sView in self.containerView.subviews {
                sView.removeFromSuperview()
            }
            interestedVC.view.frame = self.containerView.bounds
            self.containerView.addSubview(interestedVC.view)
            self.interestedVC.didMove(toParent: self)
            
        case .following:
            self.lineFollowing.backgroundColor = "#248277".color_
            self.lineInterested.backgroundColor = "#EEEEEE".color_
            self.btnFollowing.isEnabled = false
            self.btnInterested.isEnabled = true
            
            self.lblInterestedNum.backgroundColor = "#969696".color_
            self.lblFollowingNum.backgroundColor = "#248277".color_
            
            self.lblInterested.textColor = "#969696".color_
            self.lblFollowing.textColor = "#248277".color_
            //
            for sView in self.containerView.subviews {
                sView.removeFromSuperview()
            }
            followingVC.view.frame = self.containerView.bounds
            self.containerView.addSubview(followingVC.view)
            self.followingVC.didMove(toParent: self)
        }
    }

}

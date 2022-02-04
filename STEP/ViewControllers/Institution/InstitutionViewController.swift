

import UIKit
import  LGSideMenuController
class InstitutionViewController: UIViewController {

    enum typePage: String {
        case reviews
        case aboutUs
        case events
    }

    var reviewsVC: ReviewsViewController!
    var aboutUsVC: AboutUsViewController!
    var eventsVC: EventsListViewController!

    var type: typePage = .aboutUs {
        didSet {
            updateGUI()
        }
    }

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var btnReviews: UIButton!
    @IBOutlet weak var btnAboutUs: UIButton!
    @IBOutlet weak var btnEvents: UIButton!
    @IBOutlet weak var lineReview: UIView!
    @IBOutlet weak var lineAboutUs: UIView!
    @IBOutlet weak var lineEvents: UIView!




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
        AppDelegate.shared.rootViewController.navigationItem.title = "الملف الشخصي"
//        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    @IBAction func btnReviews(_ sender: Any) {
        self.type = .reviews
    }
    @IBAction func btnAboutUs(_ sender: Any) {
        self.type = .aboutUs
    }
    @IBAction func btnEvents(_ sender: Any) {
        self.type = .events
    }


    
}

extension InstitutionViewController {
    func setupView(){
        self.reviewsVC = (UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "ReviewsViewController") as! ReviewsViewController)
        self.aboutUsVC = (UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "AboutUsViewController") as! AboutUsViewController)
        self.eventsVC = (UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "EventsListViewController") as! EventsListViewController)
        self.addChild(reviewsVC)
        self.addChild(aboutUsVC)
        self.addChild(eventsVC)
    }
    func localized(){}
    func setupData(){
        self.type = .reviews
    }
    func fetchData(){}
    func updateGUI(){
        switch self.type {
        case .reviews:
            self.lineReview.backgroundColor = "#248277".color_
            self.lineEvents.backgroundColor = "#EEEEEE".color_
            self.lineAboutUs.backgroundColor = "#EEEEEE".color_            
            self.btnEvents.isEnabled = true
            self.btnAboutUs.isEnabled = true
            self.btnReviews.isEnabled = false
            
            self.btnReviews.setTitleColor("#248277".color_, for: .disabled)
            self.btnAboutUs.setTitleColor("#969696".color_, for: .normal)
            self.btnEvents.setTitleColor("#969696".color_, for: .normal)
            // move to ReviewsViewController
            for sView in self.containerView.subviews {
                sView.removeFromSuperview()
            }
            reviewsVC.view.frame = self.containerView.bounds
            self.containerView.addSubview(reviewsVC.view)
            self.reviewsVC.didMove(toParent: self)
        case .aboutUs:
            self.lineReview.backgroundColor = "#EEEEEE".color_
            self.lineEvents.backgroundColor = "#EEEEEE".color_
            self.lineAboutUs.backgroundColor = "#248277".color_
            self.btnEvents.isEnabled = true
            self.btnAboutUs.isEnabled = false
            self.btnReviews.isEnabled = true
            self.btnAboutUs.setTitleColor("#248277".color_, for: .disabled)
            self.btnReviews.setTitleColor("#969696".color_, for: .normal)
            self.btnEvents.setTitleColor("#969696".color_, for: .normal)

            // move to AboutUsViewController
            for sView in self.containerView.subviews {
                sView.removeFromSuperview()
            }
            aboutUsVC.view.frame = self.containerView.bounds
            self.containerView.addSubview(aboutUsVC.view)
            self.aboutUsVC.didMove(toParent: self)
        case .events:
            self.lineReview.backgroundColor = "#EEEEEE".color_
            self.lineEvents.backgroundColor = "#248277".color_
            self.lineAboutUs.backgroundColor = "#EEEEEE".color_
            self.btnEvents.isEnabled = false
            self.btnAboutUs.isEnabled = true
            self.btnReviews.isEnabled = true
            
            self.btnEvents.setTitleColor("#248277".color_, for: .disabled)
            self.btnAboutUs.setTitleColor("#969696".color_, for: .normal)
            self.btnReviews.setTitleColor("#969696".color_, for: .normal)
            
            // move to EventsViewController

            for sView in self.containerView.subviews {
                sView.removeFromSuperview()
            }
            eventsVC.view.frame = self.containerView.bounds
            self.containerView.addSubview(eventsVC.view)
            self.eventsVC.didMove(toParent: self)
        }
    }
    
}

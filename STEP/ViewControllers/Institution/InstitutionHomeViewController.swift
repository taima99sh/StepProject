

import UIKit
import FSCalendar

class InstitutionHomeViewController: UIViewController {
    
    @IBOutlet weak var greenView: UIView!

    
    var calendar:  FSCalendar!
    
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
        self.greenView.isHidden = false
        AppDelegate.shared.rootViewController.navigationItem.title = "الرئيسية"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.greenView.cornerRadius = self.greenView.frame.size.height / 2
    }
    

}

extension InstitutionHomeViewController {
    func setupView(){
        calendar = FSCalendar(frame: CGRect(x: 0.0, y: 100, width: self.view.frame.size.width - 40, height: 300))
        calendar.center.x = self.view.center.x
        //calendar.scrollDirection = .vertical
        calendar.scope = .week
        calendar.appearance.todaySelectionColor = "#248277".color_
        calendar.appearance.todayColor = "#248277".color_
        //calendar.appearance.titleDefaultColor = "#248277".color_
        calendar.appearance.selectionColor = "#248277".color_
        calendar.appearance.weekdayTextColor = "#248277".color_
        calendar.appearance.headerTitleColor = "#248277".color_
//        calendar.backgroundColor = "#248277".color_
        //calendar.todaySelectionColor = "#248277".color_
        self.view.addSubview(calendar)
    }
    func localized(){}
    func setupData(){}
    func fetchData(){}

}

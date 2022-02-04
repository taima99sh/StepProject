

import UIKit

class ReviewsViewController: UIViewController {
    
    @IBOutlet weak var tableView: GeneralTableView!
    

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
    

}

extension ReviewsViewController {
    func setupView(){
        self.tableView.isSelfSize = true
        self.tableView.register(UINib(nibName: "ReviewTableViewCell", bundle: nil), forCellReuseIdentifier: "ReviewTableViewCell")
    }
    func localized(){}
    func setupData(){
        tableView.EmptyDataTitle = "لاتوجد تقييمات"
        for _ in 1...10 {
            tableView.objects.append(GeneralTableViewData(identifier: "ReviewTableViewCell", object: nil, rowHeight: nil))
        }
    }
    func fetchData(){}

}

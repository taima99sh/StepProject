

import UIKit

class InstitutionListViewController: UIViewController {
    
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

extension InstitutionListViewController {
    func setupView(){
        self.tableView.isSelfSize = true
        self.tableView.register(UINib(nibName: "InstitutionListTableViewCell", bundle: nil), forCellReuseIdentifier: "InstitutionListTableViewCell")
    }
    func localized(){}
    func setupData(){
        tableView.EmptyDataTitle = "لايوجد مؤسسات تتابعها"
        for _ in 1...10 {
            tableView.objects.append(GeneralTableViewData(identifier: "InstitutionListTableViewCell", object: nil, rowHeight: nil))
        }
    }
    func fetchData(){}

}

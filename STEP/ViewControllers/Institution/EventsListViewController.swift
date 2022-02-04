

import UIKit

class EventsListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: GeneralCollectionView!
    

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
    

}

extension EventsListViewController {
    func setupView(){
        collectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
    }
    func localized(){}
    func setupData(){
        let width1 = (collectionView.frame.size.width - 30) / 2 
        let height = width1 * 1.3
        let size = CGSize.init(width: width1, height: height)
        let event: EventData = EventData(img: "2", name: "التخطيط الاستراتيجي للأهداف", owner: "جامعة فلسطين", date: "15 Oct. 2021")
        
        for _ in 1...10 {
            self.collectionView.objects.append(GeneralCollectionViewData(identifier: "HomeCollectionViewCell", object: event, cellSize: size))
        }
    }
    func fetchData(){}

}

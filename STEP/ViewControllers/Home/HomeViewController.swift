

import UIKit
import FSPagerView

class HomeViewController: UIViewController {
    
    let imageNames = ["1","2","3","4"]
    var interestedEventsArr: [EventData] = []
    
    @IBOutlet weak var interestedCollectionView: GeneralCollectionView!
    @IBOutlet weak var newEventCollectionView: GeneralCollectionView!
    @IBOutlet weak var followingEventCollectionView: GeneralCollectionView!
    
    
    @IBOutlet weak var pagerView: FSPagerView!{
        didSet {
            self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            self.pagerView.itemSize = FSPagerView.automaticSize
        }
    }
    @IBOutlet weak var pageControl: FSPageControl!{
        didSet {
            self.pageControl.numberOfPages = self.imageNames.count
            self.pageControl.contentHorizontalAlignment = .right
        }
    }

    
    
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
        AppDelegate.shared.rootViewController.navigationItem.title = "الرئيسية"
    }
    

}

extension HomeViewController {
    func setupView(){
        interestedCollectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
        newEventCollectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
        followingEventCollectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
        pagerView.automaticSlidingInterval = 5.0
        
    }
    func localized(){}
    func setupData(){
        let width1 = (interestedCollectionView.frame.size.width - (20 + 30)) / 2
        let height = interestedCollectionView.frame.size.height
        let event: EventData = EventData(img: "2", name: "التخطيط الاستراتيجي للأهداف", owner: "جامعة فلسطين", date: "15 Oct. 2021")
        self.interestedEventsArr = [event, event, event, event, event,event, event]
        let size = CGSize.init(width: width1, height: height)
        for obj in interestedEventsArr {
            self.interestedCollectionView.objects.append(GeneralCollectionViewData(identifier: "HomeCollectionViewCell", object: obj, cellSize: size))
            self.newEventCollectionView.objects.append(GeneralCollectionViewData(identifier: "HomeCollectionViewCell", object: obj, cellSize: size))
            self.followingEventCollectionView.objects.append(GeneralCollectionViewData(identifier: "HomeCollectionViewCell", object: obj, cellSize: size))
        }

        
        
    }
    func fetchData(){}

}

extension HomeViewController: FSPagerViewDataSource,FSPagerViewDelegate {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        4
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.image = UIImage(named: self.imageNames[index])
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.clipsToBounds = true
        return cell
    }
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        self.pageControl.currentPage = targetIndex
    }
    
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        self.pageControl.currentPage = pagerView.currentIndex
    }
    //
    
    
}

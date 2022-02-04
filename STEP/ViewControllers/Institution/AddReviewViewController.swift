

import UIKit

class AddReviewViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    


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

extension AddReviewViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "أضف تقييم"
            textView.textColor = UIColor.lightGray
        }
    }
    func setupView(){
        //textView.text = "أضف تقييم"
        textView.textColor = UIColor.lightGray
        self.textView.delegate = self
    }
    func localized(){}
    func setupData(){}
    func fetchData(){}

}

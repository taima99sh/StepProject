

import UIKit

class SelectTimeAndDateViewContoller: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    

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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindToAddEvent" {
            let vc = segue.destination as! AddEventViewController
            vc.txtDate.text = self.datePicker.date.toString(customFormat: "E, d MMM yyyy HH:mm")
        }
    }
    
    @IBAction func btnDismiss(_ sender: Any) {
        performSegue(withIdentifier: "unwindToAddEvent", sender: self)

    }
    

}

extension SelectTimeAndDateViewContoller {
    func setupView(){}
    func localized(){}
    func setupData(){}
    func fetchData(){}

}

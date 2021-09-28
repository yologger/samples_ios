import UIKit

class SubViewController: UIViewController {
    
    @IBOutlet weak var alarmSwitch: UISwitch!
    
    override func viewDidLoad() {
         self.alarmSwitch.isOn =  UserDefaults.standard.bool(forKey: "alarmSwitchState")
    }
    
    @IBAction func onCloseButtonClicked(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didSwitchChange(_ sender: Any) {
         UserDefaults.standard.set(alarmSwitch.isOn, forKey: "alarmSwitchState")
    }
}

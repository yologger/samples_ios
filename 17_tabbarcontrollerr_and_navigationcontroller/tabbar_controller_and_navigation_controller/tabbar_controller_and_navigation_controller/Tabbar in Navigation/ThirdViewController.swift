import UIKit

class ThirdViewController: UIViewController {
    
    @IBAction func pushBlackVC(_ sender: Any) {
        
        let blackVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BlackViewController") as! BlackViewController
        
        
        navigationController?.pushViewController(blackVC, animated: true)
    }
    
    @IBAction func presentBlackVC(_ sender: Any) {
        
        let blackVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BlackViewController") as! BlackViewController
        
        blackVC.modalPresentationStyle = .fullScreen
        
        present(blackVC, animated: true, completion: nil)
    }
}

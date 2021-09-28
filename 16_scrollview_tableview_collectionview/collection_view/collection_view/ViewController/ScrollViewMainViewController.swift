import UIKit

class ScrollViewMainViewController: UIViewController {
    
    @IBAction func openScrollView(_ sender: Any) {
        
    }
    
    @IBAction func openTableViewInScrollView(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "TableViewInScrollViewVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

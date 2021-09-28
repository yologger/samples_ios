import UIKit

class FirstViewController: UIViewController {
    
    @IBAction func pushWhiteVC(_ sender: Any) {
        let whiteVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WhiteViewController") as! WhiteViewController
        whiteVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(whiteVC, animated: true)
    }
    
    @IBAction func presentWhiteVC(_ sender: Any) {
        let whiteVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WhiteViewController") as! WhiteViewController
        whiteVC.modalPresentationStyle = .fullScreen
        present(whiteVC, animated: true, completion: nil)
    }
}

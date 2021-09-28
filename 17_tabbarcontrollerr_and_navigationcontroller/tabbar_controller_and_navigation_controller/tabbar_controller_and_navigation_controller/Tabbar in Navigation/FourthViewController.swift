import UIKit

class FourthViewController: UIViewController {
    
    override func viewDidLoad() {
        
        let label = UILabel()
        label.text = "Hello World"
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        let safeArea = view.safeAreaLayoutGuide
        label.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 0).isActive = true
        label.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: 0).isActive = true
    }
}

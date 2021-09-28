import UIKit

class TableViewMainViewController: UIViewController {
    
    override func viewDidLoad() {
        self.title = "TableView"
    }
    
    @IBAction func openTableView(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "TableViewVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func openDragDropTableView(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "DragDropTableViewVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func openEditableTableView(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "EditableTableViewVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func openTableViewWithButtons(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "TableViewWithButtonsVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func openMultipleSelectableTableView(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "MultipleSelectableTableViewVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

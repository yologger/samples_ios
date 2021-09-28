import UIKit

class CollectionViewMainViewController : UIViewController {
    
    override func viewDidLoad() {
        self.title = "CollectionView"
    }
    
    @IBAction func openCollectionView(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "CollectionViewVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func openHorizontalCollectionView(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "HorizontalCollectionViewVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func openDragDropCollectionView(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "DragDropCollectionViewVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func openEditableCollectionView(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "EditableCollectionViewVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func openCollectionViewWithButtons(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "CollectionViewWithButtonsVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func openMultipleSelectableCollectionView(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "MultipleSelectableCollectionViewVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

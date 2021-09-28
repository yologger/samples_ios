import UIKit

class CollectionViewCellWithButtons: UICollectionViewCell {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var delegate: CollectionViewCellWithButtonsDelegate?
    var indexPath: IndexPath?
    
    @IBAction func onClear(_ sender: Any) {
        guard let delegate = self.delegate, let indexPath = self.indexPath else { return }
        delegate.onClear(self, cellForItemAt: indexPath)
    }
    
    @IBAction func onReorder(_ sender: Any) {
        guard let delegate = self.delegate, let indexPath = self.indexPath  else { return }
        delegate.onReorder(self, cellForItemAt: indexPath)
    }
}

protocol CollectionViewCellWithButtonsDelegate: AnyObject {
    func onClear(_ cell: CollectionViewCellWithButtons, cellForItemAt indexPath: IndexPath)
    func onReorder(_ cell: CollectionViewCellWithButtons, cellForItemAt indexPath: IndexPath)
}

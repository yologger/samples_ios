import UIKit

class CellWithButtons: UICollectionViewCell {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var onClearButtonClicked: ((CellWithButtons) -> Void)?
    var onReorderButtonClicked: ((CellWithButtons) -> Void)?
    
    @IBAction func onClear(_ sender: Any) {
        onClearButtonClicked?(self)
    }
    
    @IBAction func onReorder(_ sender: Any) {
        onReorderButtonClicked?(self)
    }
    
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var reorderButton: UIButton!
    
//    override func layoutSubviews() {
//        self.contentView.isUserInteractionEnabled = false
//    }
    
    override func prepareForReuse() {
        print("prepareForReuse")
    }
}

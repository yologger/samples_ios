import UIKit

class TableViewCellWithButtons: UITableViewCell {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    weak var delegate: TableViewCellWithButtonsDelegate?
    var indexPath: IndexPath?
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    @IBAction func onDelete(_ sender: Any) {
        guard let delegate = self.delegate, let indexPath = self.indexPath  else { return }
        delegate.onDelete(self, cellForRowAt: indexPath)
    }
    
    @IBAction func onIndex(_ sender: Any) {
        guard let delegate = self.delegate, let indexPath = self.indexPath else { return }
        delegate.onIndex(self, cellForRowAt: indexPath)
    }
}


protocol TableViewCellWithButtonsDelegate: AnyObject {
    func onDelete(_ cell: TableViewCellWithButtons, cellForRowAt indexPath: IndexPath)
    func onIndex(_ cell: TableViewCellWithButtons, cellForRowAt indexPath: IndexPath)
}

import UIKit

class CollectionViewWithButtonsVC: UIViewController {
    
    var items: Array<ReorderableItem> = [
        ReorderableItem(id: "0", name: "Ronaldo"),
        ReorderableItem(id: "1", name: "Ronaldo"),
        ReorderableItem(id: "2", name: "Ronaldo"),
        ReorderableItem(id: "3", name: "Ronaldo"),
        ReorderableItem(id: "4", name: "Ronaldo"),
        ReorderableItem(id: "5", name: "Ronaldo"),
        ReorderableItem(id: "6", name: "Ronaldo"),
        ReorderableItem(id: "7", name: "Ronaldo"),
        ReorderableItem(id: "8", name: "Ronaldo"),
        ReorderableItem(id: "9", name: "Ronaldo"),
        ReorderableItem(id: "10", name: "Ronaldo"),
        ReorderableItem(id: "11", name: "Ronaldo")
    ]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // printItems()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.dragDelegate = self
        self.collectionView.dropDelegate = self
        self.collectionView.backgroundColor = .blue
        self.collectionView.dragInteractionEnabled = true
        
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        // flowLayout.minimumLineSpacing = 20
        // flowLayout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        // self.collectionView.collectionViewLayout = flowLayout
    }
    
    func reorderItems(coordinator: UICollectionViewDropCoordinator, destinationIndexPath: IndexPath, collectionView: UICollectionView) {
        
        if let item = coordinator.items.first, let sourceIndexPath = item.sourceIndexPath {
            
//            print("SOURCE INDEXPATH: \(sourceIndexPath.item)")
//            print("DESTINATION INDEXPATH: \(destinationIndexPath.item)")
//            print("DESERIALIZED ITEM: \(item.dragItem.localObject as! ReorderableItem)")
            
            collectionView.performBatchUpdates({
                self.items.remove(at: sourceIndexPath.item)
                self.items.insert(item.dragItem.localObject as! ReorderableItem, at: destinationIndexPath.item)
                collectionView.deleteItems(at: [sourceIndexPath])
                collectionView.insertItems(at: [destinationIndexPath])
            }, completion: nil)
            // coordinator.drop(item.dragItem, toItemAt: destinationIndexPath)
        }
    }
    
    //    @objc func onClearButtonClicked(_ sender: UIButton) {
    //        print("onClearButtonClicked")
    //    }

}

extension CollectionViewWithButtonsVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellWithButtons", for: indexPath) as! CollectionViewCellWithButtons
        
        cell.idLabel.text = items[indexPath.item].id
        cell.nameLabel.text = items[indexPath.item].name
        cell.indexPath = indexPath
        cell.delegate = self
        return cell
    }
}


extension CollectionViewWithButtonsVC: UICollectionViewDragDelegate {
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let item = self.items[indexPath.item]
        let itemProvider = NSItemProvider(object: item.id as NSString)
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = item
        return [dragItem]
    }
}

extension CollectionViewWithButtonsVC: UICollectionViewDropDelegate {
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        
        var destinationIndexPath: IndexPath
        if let indexPath = coordinator.destinationIndexPath {
            destinationIndexPath = indexPath
        } else {
            let row = collectionView.numberOfItems(inSection: 0)
            destinationIndexPath = IndexPath(item: row - 1, section: 0)
        }
        
        if coordinator.proposal.operation == .move {
            self.reorderItems(coordinator: coordinator, destinationIndexPath: destinationIndexPath, collectionView: collectionView)
            collectionView.reloadData()
        } else if coordinator.proposal.operation == .cancel {
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        if collectionView.hasActiveDrag {
            return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        }
        return UICollectionViewDropProposal(operation: .forbidden)
    }
}


extension CollectionViewWithButtonsVC : CollectionViewCellWithButtonsDelegate {
    
    func onClear(_ cell: CollectionViewCellWithButtons, cellForItemAt indexPath: IndexPath) {
        self.items.remove(at: indexPath.item)
        self.collectionView.deleteItems(at: [indexPath])
        self.collectionView.reloadData()
    }
    
    func onReorder(_ cell: CollectionViewCellWithButtons, cellForItemAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: nil, message: "onReorder() at: \(indexPath.item)", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
}


extension CollectionViewWithButtonsVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: nil, message: "didSelectItemsAt: \(indexPath.item)", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension CollectionViewWithButtonsVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
}

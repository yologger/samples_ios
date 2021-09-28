import UIKit

class DragDropCollectionViewVC: UIViewController {
    
    var people: Array<Person> = [
        Person(id: 1, name: "Ronaldo"),
        Person(id: 2, name: "Kane"),
        Person(id: 3, name: "Benzema"),
        Person(id: 4, name: "Ramos"),
        Person(id: 5, name: "Son"),
        Person(id: 6, name: "Bale"),
        Person(id: 7, name: "James"),
        Person(id: 8, name: "Casemiro"),
        Person(id: 9, name: "Messi"),
        Person(id: 10, name: "Lampard"),
        Person(id: 11, name: "Ronaldo"),
        Person(id: 12, name: "Kane"),
        Person(id: 13, name: "Benzema"),
        Person(id: 14, name: "Ramos"),
        Person(id: 15, name: "Son"),
        Person(id: 16, name: "Bale"),
        Person(id: 17, name: "James"),
        Person(id: 18, name: "Casemiro"),
        Person(id: 19, name: "Messi"),
        Person(id: 20, name: "Lampard")
    ]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.backgroundColor = .blue
        self.collectionView.dragInteractionEnabled = true
        self.collectionView.dragDelegate = self
        self.collectionView.dropDelegate = self
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        // flowLayout.minimumLineSpacing = 20
        flowLayout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        self.collectionView.collectionViewLayout = flowLayout
        
        self.collectionView.reloadData()
    }
    
    func reorderItems(coordinator: UICollectionViewDropCoordinator, destinationIndexPath: IndexPath, collectionView: UICollectionView) {
        if let item = coordinator.items.first, let sourceIndexPath = item.sourceIndexPath {
            collectionView.performBatchUpdates({
                self.people.remove(at: sourceIndexPath.item)
                self.people.insert(item.dragItem.localObject as! Person, at: destinationIndexPath.item)
                
                collectionView.deleteItems(at: [sourceIndexPath])
                collectionView.insertItems(at: [destinationIndexPath])
                
            }, completion: nil)
            coordinator.drop(item.dragItem, toItemAt: destinationIndexPath)
        }
    }
}


extension DragDropCollectionViewVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return people.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DragDropCollectionViewCell", for: indexPath) as! ReorderableCollectionViewCell
        cell.idLabel.text = "\(people[indexPath.item].id)"
        cell.nameLabel.text = people[indexPath.item].name
        
        return cell
    }
    
    
}

extension DragDropCollectionViewVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
}

extension DragDropCollectionViewVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}

extension DragDropCollectionViewVC: UICollectionViewDragDelegate {
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let person = self.people[indexPath.item]
        let itemProvider = NSItemProvider(object: "\(person.id)" as NSString)
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = person
        return [dragItem]
    }
}

extension DragDropCollectionViewVC: UICollectionViewDropDelegate {
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
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        
        if collectionView.hasActiveDrag {
            return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        }
        return UICollectionViewDropProposal(operation: .forbidden)
    }
}

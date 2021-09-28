import UIKit

class DragDropTableViewVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var people = [
        Person(id: 0, name: "Ronaldo"),
        Person(id: 1, name: "James"),
        Person(id: 2, name: "Benzema"),
        Person(id: 3, name: "Bale"),
        Person(id: 4, name: "Ramos"),
        Person(id: 5, name: "Marcelo"),
        Person(id: 6, name: "Messi"),
        Person(id: 7, name: "Neymar"),
        Person(id: 8, name: "Suarez"),
        Person(id: 9, name: "Kane"),
        Person(id: 10, name: "Son")
    ]
    
    override func viewDidLoad() {
        self.tableView.dataSource = self
        self.tableView.dragDelegate = self
        self.tableView.dropDelegate = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 200
        self.tableView.dragInteractionEnabled = true
    }
    
    func reorderRows(coordinator: UITableViewDropCoordinator, destinationIndexPath: IndexPath, tableView: UITableView) {
        if let row = coordinator.items.first, let sourceIndexPath = row.sourceIndexPath {
            tableView.performBatchUpdates({
                self.people.remove(at: sourceIndexPath.row)
                self.people.insert(row.dragItem.localObject as! Person, at: destinationIndexPath.row)
                
                tableView.deleteRows(at: [sourceIndexPath], with: .automatic)
                tableView.insertRows(at: [destinationIndexPath], with: .automatic)
            }, completion: nil)
        }
    }
}

extension DragDropTableViewVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DragDropTableViewCell", for: indexPath) as! DragDropTableViewCell
        cell.idLabel.text = "\(people[indexPath.row].id)"
        cell.nameLabel.text = people[indexPath.row].name
        return cell
    }
}

extension DragDropTableViewVC: UITableViewDragDelegate {
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let person = self.people[indexPath.row]
        let itemProvider = NSItemProvider(object: "\(person.id)" as NSString)
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = person
        return [dragItem]
    }
}

extension DragDropTableViewVC: UITableViewDropDelegate {
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        
        var destinationIndexPath: IndexPath
        if let indexPath = coordinator.destinationIndexPath {
            destinationIndexPath = indexPath
        } else {
            let row = tableView.numberOfRows(inSection: 0)
            destinationIndexPath = IndexPath(item: row - 1, section: 0)
        }
        
        if coordinator.proposal.operation == .move {
            self.reorderRows(coordinator: coordinator, destinationIndexPath: destinationIndexPath, tableView: tableView)
        }
    }
    
    func tableView(_ tableView: UITableView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
        if tableView.hasActiveDrag {
            return UITableViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        }
        return UITableViewDropProposal(operation: .forbidden)
    }
}





























import UIKit

class TableViewWithButtonsVC: UIViewController {
    
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
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        self.tableView.dataSource = self
        self.tableView.dragDelegate = self
        self.tableView.dropDelegate = self
        self.tableView.dragInteractionEnabled = true
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 200
        
        let nib = UINib(nibName: "TableViewCellWithButtons", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "TableViewCellWithButtons")
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

extension TableViewWithButtonsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellWithButtons", for: indexPath) as! TableViewCellWithButtons
        cell.idLabel.text = "\(people[indexPath.row].id)"
        cell.nameLabel.text = people[indexPath.row].name
        cell.indexPath = indexPath
        cell.delegate = self
        return cell
    }
}

extension TableViewWithButtonsVC: UITableViewDragDelegate {
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let person = self.people[indexPath.row]
        let itemProvider = NSItemProvider(object: "\(person.id)" as NSString)
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = person
        return [dragItem]
    }
}

extension TableViewWithButtonsVC: UITableViewDropDelegate {
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
            tableView.reloadData()
        } else if coordinator.proposal.operation == .cancel {
            
        }
    }
    
    func tableView(_ tableView: UITableView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
        if tableView.hasActiveDrag {
            return UITableViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        }
        return UITableViewDropProposal(operation: .forbidden)
    }
}



extension TableViewWithButtonsVC: TableViewCellWithButtonsDelegate {
    
    func onDelete(_ cell: TableViewCellWithButtons, cellForRowAt indexPath: IndexPath) {
        self.people.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .fade)
        self.tableView.reloadData()
    }
    
    func onIndex(_ cell: TableViewCellWithButtons, cellForRowAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: nil, message: "onIndext() at: \(indexPath.row)", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}

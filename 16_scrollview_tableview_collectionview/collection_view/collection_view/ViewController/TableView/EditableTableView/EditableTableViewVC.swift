import UIKit

class EditableTableViewVC: UIViewController {
    
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
    
    lazy var rightButton: UIBarButtonItem = editButtonItem
    
    // Toggle edit button
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.tableView.setEditing(editing, animated: animated)
    }
    
    override func viewDidLoad() {
        self.navigationItem.rightBarButtonItem = editButtonItem
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 200
        // self.tableView.isEditing = false
    }
    
}

extension EditableTableViewVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "EditableTableViewCell", for: indexPath) as! EditableTableViewCell
        cell.idLabel.text = "\(people[indexPath.row].id)"
        cell.nameLabel.text = people[indexPath.row].name
        return cell
    }
}

extension EditableTableViewVC: UITableViewDelegate {
    
    // Reorder controller appears on the right side of the cell
    // Override to support rearranging the table view.
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        var rowToMove = people[sourceIndexPath.row]
        people.remove(at: sourceIndexPath.row)
        people.insert(rowToMove, at: destinationIndexPath.row)
    }
    
    
    // Override to support conditional rearranging of the table view.
    // func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
    //      return true
    // }
    
    // Override to support conditional editing of the table view
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        true
    }
    
    // Decide style of each row
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.row < 7 {
            return .delete
        } else if indexPath.row == 7 || indexPath.row == 8 {
            return .insert
        } else {
            return .none
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .insert:
            print("insert")
        case .delete:
            print("delete")
            people.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        case .none:
            print("none")
        default:
            print("error")
        }
    }
}

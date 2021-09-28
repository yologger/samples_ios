import UIKit

class MultipleSelectableTableViewVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var removeButton: UIButton!
    @IBOutlet weak var tableViewBottomConstraintToRemoveButton: NSLayoutConstraint!
    var tableViewBottomAnchorToRemoveButtonTop: NSLayoutConstraint!
    var tableViewBottomAnchorToSafeAreaBottom: NSLayoutConstraint!
    
    @IBAction func onRemove(_ sender: Any) {
        guard let selectedRows = self.tableView.indexPathsForSelectedRows else { return }
        for selectedRow in selectedRows {
            print(selectedRow.row)
            people.remove(at: selectedRow.row)
        }
        tableView.deleteRows(at: selectedRows, with: .fade)
    }
    
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
        toggleRemoveButtonVisibility(isEditing: editing)
    }
    
    private func toggleRemoveButtonVisibility(isEditing: Bool) {
        if (isEditing) {
            self.removeButton.isHidden = false
            tableViewBottomAnchorToSafeAreaBottom.isActive = false
            tableViewBottomAnchorToRemoveButtonTop.isActive = true
        } else {
            self.removeButton.isHidden = true
            tableViewBottomAnchorToRemoveButtonTop.isActive = false
            tableViewBottomAnchorToSafeAreaBottom.isActive = true
        }
    }
    
    override func viewDidLoad() {
        self.navigationItem.rightBarButtonItem = editButtonItem
        
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 200
        self.tableView.allowsMultipleSelectionDuringEditing = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        
        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        self.tableViewBottomAnchorToRemoveButtonTop = tableView.bottomAnchor.constraint(equalTo: self.removeButton.topAnchor)
        self.tableViewBottomAnchorToSafeAreaBottom = tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        
        self.removeButton.isHidden = !isEditing
        tableViewBottomAnchorToRemoveButtonTop.isActive = isEditing
        tableViewBottomAnchorToSafeAreaBottom.isActive = !isEditing
    }
}

extension MultipleSelectableTableViewVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "MultipleSelectableTableViewCell", for: indexPath) as! MultipleSelectableTableViewCell
        cell.idLabel.text = "\(people[indexPath.row].id)"
        cell.nameLabel.text = people[indexPath.row].name
        return cell
    }
}

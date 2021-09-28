import UIKit

class TableViewVC: UIViewController {
    
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
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 300
    }
}


extension TableViewVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.idLabel.text = "\(self.people[indexPath.row].id)"
        cell.nameLabel.text = self.people[indexPath.row].name
        return cell
    }
}

extension TableViewVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alertController = UIAlertController(title: nil, message: "didSelectRowAt: \(indexPath.row)", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}

import UIKit

class EditableCollectionViewVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
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
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
    }
    
    override func viewDidLoad() {
        self.navigationItem.rightBarButtonItem = editButtonItem
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.collectionView.backgroundColor = .orange
    }
}

extension EditableCollectionViewVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return people.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EditableCollectionViewCell", for: indexPath) as! EditableCollectionViewCell
        cell.idLabel.text = "\(people[indexPath.row].id)"
        cell.nameLabel.text = people[indexPath.row].name
        return cell
    }
}

extension EditableCollectionViewVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}

extension EditableCollectionViewVC: UICollectionViewDelegate {
    
}

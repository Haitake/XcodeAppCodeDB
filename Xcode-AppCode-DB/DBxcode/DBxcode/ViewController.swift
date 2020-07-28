import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    
    @IBOutlet weak var personTable: UITableView!
    
    let tableCell = "cell"
    
    var db:DBHelper = DBHelper()
    
    var person:[Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personTable.register(UITableViewCell.self, forCellReuseIdentifier: tableCell)
        personTable.delegate = self
        personTable.dataSource = self
        
        db.insert(id: 1, name: "Natálka", age: 19)
        db.insert(id: 2, name: "Honzíček", age: 22)
        db.insert(id: 3, name: "MocnýPán", age: 23)
        db.insert(id: 4, name: "Franta", age: 44)
        db.insert(id: 5, name: "UžNevímKdo", age: 34)
        
        person = db.read()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return person.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: tableCell)!
        cell.textLabel?.text = "Name: " + person[indexPath.row].name + ", " + "Age: " + String(person[indexPath.row].age)
        
        return cell
    }
}

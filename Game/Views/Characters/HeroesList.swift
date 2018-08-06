import UIKit
import Magic
import RealmSwift

let realm = try! Realm()

class HeroesList: UITableViewController {
  
  // TODO: Брать список персонажей из базы
//  var heroes: [[String:String]] = [["name": "Riley", "level": "11"], ["name":"Jane", "level": "17"]]
  let heroes = realm.objects(Hero.self)
//  var heroes: [Hero] = [Hero()]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return heroes.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "characterIdentifier", for: indexPath)

    // Устанавливаем имена персонажей
//    cell.textLabel?.text = heroes[indexPath.row]["name"]
    
    // Их уровни
//    cell.detailTextLabel?.text = String("Level: \(heroes[indexPath.row]["level"]!)")
    
    return cell
  }
}

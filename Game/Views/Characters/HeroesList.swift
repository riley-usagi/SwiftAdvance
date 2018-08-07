import UIKit
import Magic
import RealmSwift

let realm = try! Realm()

class HeroesList: UITableViewController {

  let heroes = realm.objects(Hero.self)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    magic(Realm.Configuration.defaultConfiguration.fileURL!)
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return heroes.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "heroIdentifier", for: indexPath)

    // Устанавливаем имена персонажей
    cell.textLabel?.text = heroes[indexPath.row].name
    
    // Их уровни
    cell.detailTextLabel?.text = String("Level: \(heroes[indexPath.row].level)")
    
    return cell
  }
}

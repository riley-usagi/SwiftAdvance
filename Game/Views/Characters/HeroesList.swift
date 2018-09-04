import UIKit
import Magic
import RealmSwift

class HeroesList: UITableViewController {
  
  let heroes = realm.objects(Hero.self)
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  /// Количество секций (должна быть минимум одна)
  ///
  /// - Parameter tableView: объект таблицы
  /// - Returns: колицкство секций (минимум одна)
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  /// Количество ячеек
  ///
  /// - Parameters:
  ///   - tableView: объект таблицы
  ///   - section: секция
  /// - Returns: количество ячеек
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return heroes.count
  }
    
  /// Настрока каждой конкретной ячейки
  ///
  /// - Parameters:
  ///   - tableView: объект таблицы
  ///   - indexPath: номер ячейки
  /// - Returns: объект ячейки
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "heroIdentifier", for: indexPath)
    
    // Устанавливаем имена персонажей
    cell.textLabel?.text = heroes[indexPath.row].name
    
    // Их уровни
    cell.detailTextLabel?.text = String("Level: \(heroes[indexPath.row].level)")
    
    return cell
  }
  
  /// Выбор ячейки
  ///
  /// - Parameters:
  ///   - tableView: объект таблицы
  ///   - indexPath: номер ячейки
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    Player.shared.currentHero = heroes[indexPath.row]
  }
}

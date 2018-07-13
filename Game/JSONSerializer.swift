import Foundation
import RealmSwift

class JSONSerializer {
  func serialize(input sourceName: String) {
    let path = Bundle.main.path(forResource: sourceName, ofType: nil)
    let url = URL(fileURLWithPath: path!)
    let jsonDecoder = JSONDecoder()
    
    do {
      let data = try Data(contentsOf: url)
      let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
      guard json is [AnyObject] else {
        assert(false, "failed to parse")
        return
      }
      do {
        let monsters = try jsonDecoder.decode([Monster].self, from: data)
        let realm = try! Realm()
        for monster in monsters {
          try! realm.write {
            realm.add(monster)
          }
        }
      } catch {
        print("failed to convert data")
      }
    } catch let error {
      print(error)
    }
  }
}

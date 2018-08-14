import Foundation
import RealmSwift

/// Сервис для обработки запросов к внутренней базе Realm
class RealmService {
  private init() {}
  static let shared = RealmService()
  
  var realm = try! Realm()
  
  // NOTE: Maybe working wrong
  func all<T: Object>(in realm: Realm = try! Realm()) -> Results<T> {
    return realm.objects(T.self)
  }
  
  func create<T: Object>(_ object: T) {
    do {
      try realm.write {
        realm.add(object)
      }
    } catch {
      post(error)
    }
  }
  
  func update<T: Object>(_ object: T, with dictionary: [String: Any?]) {
    do {
      try realm.write {
        for (key, value) in dictionary {
          object.setValue(value, forKey: key)
        }
      }
    } catch {
      post(error)
    }
  }
  
  func delete<T: Object>(_ object: T) {
    do {
      try realm.write {
        realm.delete(object)
      }
    } catch {
      post(error)
    }
  }
  
  func post(_ error: Error) {
    NotificationCenter.default.post(name: NSNotification.Name("RealmError"), object: error)
  }
  
  func observeRealmErrors(in vc: UIViewController, completion: @escaping (Error?) -> Void) {
    NotificationCenter.default.addObserver(forName: NSNotification.Name("RealmError"), object: nil, queue: nil) { (notification) in
      completion(notification.object as? Error)
    }
  }
  
  func stopObservingErrors(in vc: UIViewController) {
    NotificationCenter.default.removeObserver(vc, name: NSNotification.Name("RealmError"), object: nil)
  }
  
}


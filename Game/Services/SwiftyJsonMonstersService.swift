import Foundation
import SwiftyJSON
import Alamofire
import Magic


/// Пример сервиса на основе SwiftyJSON
class SwiftyJsonMonstersService {
  
  /// Список всех монстров
  let url = URL(string: "https://ragnarok-open-api.herokuapp.com/monsters")
  
  
  func loadMonstersData(completion: @escaping ([Monster]) -> Void) {
    
    Alamofire.request(url!, method: .get).responseJSON { (response) in
      guard let data = response.value else { return }
      
      magic(data)
      
      let json = try! JSON(data: data as! Data)
      
      let monster = json.compactMap { Monster(json: $0.1) }
      
      completion(monster)
    }
    
  }
  
  
  /// Стандартная конфигурация
//  let configuration = URLSessionConfiguration.default
  
  // Добавляем заголовки из Alamofire
//  configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
  
  // Применяем настройки
//  let sessionManager = SessionManager(configuration: configuration)
  
//  let parameters: Parameters = Dictionary()

  init() {}
  
//  sessionManager.request(url, method: .get, parameters: parameters).responseData { (response) in
//    magic(response)
//    let _ = sessionManager // retain
//  }
  
}

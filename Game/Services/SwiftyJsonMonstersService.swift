//import Foundation
//import SwiftyJSON
//import Alamofire
//import Magic
//
///// Пример сервиса на основе SwiftyJSON
//class SwiftyJsonMonstersService {
//  
//  /// Список всех монстров
//  let url = URL(string: "https://ragnarok-open-api.herokuapp.com/monsters")
//  
//  // TODO: explaining the @escaping parameter 
//  /// Метод получения списка всех доступных монстров в игре через API
//  func allMonsters(completion: @escaping ([Monster]) -> Void) {
//    
//    // Процесс запроса
//    Alamofire.request(url!, method: .get).responseData { (response) in
//      
//      // Проверка получения данных
//      guard let data = response.value else { return }
//      
//      // Переработка данных формата Data в формат Json
//      let json = try! JSON(data: data)
//      
//      /// Список монстров в формате обработанных объектов
//      let monsters = json.compactMap { Monster(json: $0.1) }
//      
//      // Возвращаем списко с монстрами через "сбегающее" замыкание обратно к вызвавшему данный метод
//      completion(monsters)
//    }
//  }
//  
//  
//  /// Стандартная конфигурация
//  //  let configuration = URLSessionConfiguration.default
//  
//  // Добавляем заголовки из Alamofire
//  //  configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
//  
//  // Применяем настройки
//  //  let sessionManager = SessionManager(configuration: configuration)
//  
//  //  let parameters: Parameters = Dictionary()
//  
//  init() {}
//  
//  //  sessionManager.request(url, method: .get, parameters: parameters).responseData { (response) in
//  //    magic(response)
//  //    let _ = sessionManager // retain
//  //  }
//  
//}

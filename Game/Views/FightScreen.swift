import UIKit
import Magic
import Alamofire

// Общий принцип работ контроллёра:
//    * Идёт запрос к API на получение списка монстров с уровнем +/- 10 от уровнея героя
//    * Начинается процесс битвы.
//    * Монстр выбирается каждый раз случайно из того списка что был заранее получен в запросе к API
//    * После убийства монстра - берётся следующи. И так до тех пор пока пользователь не изменит какие-либо настройки

class FightScreen: UIViewController {
  
  @IBOutlet weak var monsterName: UILabel!
  @IBOutlet weak var monsterLevel: UILabel!
  @IBOutlet weak var monsterHp: UILabel!
  @IBOutlet weak var monsterHpProgressBar: UIProgressView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    

    // Стандартная конфигурация
    let configuration = URLSessionConfiguration.default
    
    // Добавляем заголовки из Alamofire
    configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
    
    configuration.httpMaximumConnectionsPerHost = 10
    
    
    // Применяем настройки
    let sessionManager = SessionManager(configuration: configuration)
    
    let parameters: Parameters = [:]
    
    sessionManager.request("localhost:8080/monsters", method: .get, parameters: parameters).responseJSON { (response) in
      magic(response)
    }
  }
  
  
  /*
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
}

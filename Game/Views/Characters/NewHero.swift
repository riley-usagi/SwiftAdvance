import UIKit
import Magic

class NewHero: UIViewController {
  
  // Первоначальные характеристики персонажа
  var str         = 1
  var agi         = 1
  var vit         = 1
  var int         = 1
  var dex         = 1
  var luk         = 1
  var statPoints  = 7 {
    willSet {
      if newValue == 0 {
        createButton.isEnabled = true
        //деактивируем кнопки после того как Statpoints == 0
        for i in 0...(buttonToDisable.count - 1) {
          buttonToDisable[i].isEnabled = false
        }
      }
    }
    
    didSet {
      // Обновляем визуальное значение количества очков умений
//      statPointsLabel.text = String("Statpoints: \(statPoints)")
        statPointsLabel.text = "Statpoints: \(statPoints)"
    }
  }
    
  @IBOutlet var buttonToDisable: [UIButton]!
  
  /// Имя героя
  @IBOutlet weak var heroNameLabel: UITextField!
  
  /// Лейбл с указанием на оставшееся количество очков умений
  @IBOutlet weak var statPointsLabel: UILabel!
  
  /// Кнопка создания персонажа (изначально заблокирована)
  @IBOutlet weak var createButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    /// Действие закрывающее клавиатуру
    let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
    view?.addGestureRecognizer(hideKeyboardGesture)
    
    /// Свайп-возврат к предыдущему экрану
    let goBackSwipe = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
    goBackSwipe.direction = UISwipeGestureRecognizerDirection.right
    self.view.addGestureRecognizer(goBackSwipe)
  }
  
  /// Процесс возвращения на предыдущий экран
  @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
    dismiss(animated: true, completion: nil)
  }
  
  /// Закрывает клавиатуру при нажатии на любое место в пределах экрана
  @objc func hideKeyboard() {
    self.view?.endEditing(true)
  }
  
  /// Обновление статов
  @IBAction func updateStatAction(_ sender: UIButton) {
    if statPoints > 0 {
      switch sender.tag {
      case 1:
        str += 1
        sender.setTitle("STR: \(str)", for: .normal)
      case 2:
        agi += 1
        sender.setTitle("AGI: \(agi)", for: .normal)
      case 3:
        vit += 1
        sender.setTitle("VIT: \(vit)", for: .normal)
      case 4:
        int += 1
        sender.setTitle("INT: \(int)", for: .normal)
      case 5:
        dex += 1
        sender.setTitle("DEX: \(dex)", for: .normal)
      case 6:
        luk += 1
        sender.setTitle("LUK: \(luk)", for: .normal)
      default:
        magic("default")
      }
      statPoints -= 1
    }
  }
  
  /// Создание персонажа
  @IBAction func createHeroAction(_ sender: UIButton) {
    let newHero   = Hero()
    newHero.name  = heroNameLabel.text!
    newHero.str   = str
    
    try! realm.write {
      realm.add(newHero)
    }
  }
  
}

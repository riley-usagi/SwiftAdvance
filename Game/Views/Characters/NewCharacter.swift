//
//  NewCharacter.swift
//  Game
//
//  Created by Riley Usagi on 05.08.2018.
//  Copyright © 2018 Riley Usagi. All rights reserved.
//

import UIKit

class NewCharacter: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    /// Свайп-возврат к предыдущему экрану
    let goBackSwipe = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
    goBackSwipe.direction = UISwipeGestureRecognizerDirection.right
    self.view.addGestureRecognizer(goBackSwipe)
  }
  
  /// Процесс вовзращения на предыдущий экран
  @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
    dismiss(animated: true, completion: nil)
  }
}

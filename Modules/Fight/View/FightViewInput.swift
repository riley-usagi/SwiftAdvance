protocol FightViewInput: class {
  /// Настраивает начальное состояние Экрана
  func setupInitialState()
  
  /// Вывести текст на экран
  ///
  /// - Parameter content: Текст
  func show(content: String)
}

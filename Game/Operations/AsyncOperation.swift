import Foundation

/// Базовая асинхрнная операция для дальнейшего наследования
class AsyncOperation: Operation {
  
  /// Статус операции
  ///
  /// - isReady: Готовая к выполнению
  /// - isExecuting: Выполняется
  /// - isFinished: Завершена
  enum State: String {
    case isReady, isExecuting, isFinished
  }
  
  /// Асинхронна? (Да)
  override var isAsynchronous: Bool {
    return true
  }
  
  /// Состояние операции (меняется)
  var state = State.isReady {
    willSet {
      willChangeValue(forKey: state.rawValue)
      willChangeValue(forKey: newValue.rawValue)
    }
    didSet {
      didChangeValue(forKey: oldValue.rawValue)
      didChangeValue(forKey: state.rawValue)
    }
  }
  
  /// Выполняется в данный момент?
  override var isExecuting: Bool {
    return state == .isExecuting
  }
  
  /// Завершена?
  override var isFinished: Bool {
    return state == .isFinished
  }
  
  /// Запуск операции
  override func start() {
    
    // Для начала проверяем - не отменена ли операция ранее.
    // И если да, то устанавливаем её как уже завершёную.
    guard !self.isCancelled else {
      state = .isFinished
      return
    }
    
    state = .isExecuting
    main()
  }
}

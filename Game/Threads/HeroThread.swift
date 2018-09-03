import Foundation
import Magic

class HeroThread: Thread {
  override func main() {
    magic("hello hero")
  }
}

import UIKit
import Magic
import AdaptiveController
import CoreGraphics
import QuartzCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    UITabBar.appearance().tintColor = tabColor
    UITabBar.appearance().barTintColor = UIColor.clear
    UITabBar.appearance().shadowImage = UIImage()
    UITabBar.appearance().selectionIndicatorImage = UIImage(named: "backgroud_tab")
    UITabBar.appearance().itemPositioning = UITabBarItemPositioning.fill
    UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.white], for: UIControlState.normal)
    UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: tabColor], for: UIControlState.selected)
    
    let tabBarController: UITabBarController? = window?.rootViewController as? UITabBarController
    let tabBar: UITabBar? = tabBarController?.tabBar
    tabBar?.barTintColor = tabColor
    tabBar?.isTranslucent = false
    tabBar?.clipsToBounds = true
    if #available(iOS 10.0, *) {
      tabBar?.unselectedItemTintColor = UIColor.white
    }
    
    // TODO: Needed to finished this part
    // Uncomment one of two adaptive states logic
    // 1. Date based logic
    // let installDate = Date(dateString: "2014-07-7")
    // let adaptiveState = AdaptiveDateState(installDate: installDate, currentDate: Date(), countDaysToSmallTextState: countDaysToSmallTextState, countDaysToImageState: countDaysToImageState)
    
    // 2. Launches count logic
    let curentLaunch = 4 //update current launc number to watch tab bar adaptation
    let adaptiveState = AdaptiveLaunchesState(curentCountLaunches: curentLaunch, countLaunchesToSmallTextState: countDaysForSmaltextState, countLaunchesToImageState: countDaysForImageModeState)
    
    
    let butonsApperances = buttonsAppearancesGenerate()
    if let arrayButtons = tabBar?.items as? [AdaptiveTabBarItem] {
      AdaptiveButtonsStateManager.configureButtonsState(state: adaptiveState, buttonsAray: arrayButtons, buttonsAppearance: butonsApperances)
    }
    
    return true
  }
  
  func buttonsAppearancesGenerate() -> [AdaptiveButtonAppearance] {
    
    let imageExtensionsForStates: Dictionary = [
      kDefaultAdaptiveState: "",
      kSmallTitleAdaptiveState: "_smalltitle",
      kImageAdaptiveState: "_bigimage",
      kSmallTitleAdaptiveState + selected: "_smalltitle",
      kImageAdaptiveState + selected: "_bigimage",
      ]
    
    /// Настройки поведения TabBar'a
    let watchApperance = AdaptiveButtonAppearance()
    
    // Текст для большого размера
    watchApperance.setButonTitle(title: "Fight", state: kDefaultAdaptiveState)
    
    // Текст для среднего размера
    watchApperance.setButonTitle(title: "Fight", state: kSmallTitleAdaptiveState)
    
    // Текст для состояния "иконки" (отсутствует)
    watchApperance.setButonTitle(title: "", state: kImageAdaptiveState)
    
    // Цвет заголовка кнопки
    watchApperance.setTitleColor(color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), state: kDefaultAdaptiveState)
    
    // Шрифт для текста стандартного размера
    watchApperance.setButonTitleFontForState(font: defaultFont, state: kDefaultAdaptiveState)
    
    // Шрифт для текста среднего размера
    watchApperance.setButonTitleFontForState(font: defaultSmallTitleModeFont, state: kSmallTitleAdaptiveState)
    
    
    watchApperance.setImageNamesForStatesImageExtesions(imageName: "attack", imageExtensionsForState: imageExtensionsForStates)
    watchApperance.setImageInsets(insets: defaultInsets, state: kDefaultAdaptiveState)
    watchApperance.setImageInsets(insets: defaultSmallTitleModeImageInsets, state: kSmallTitleAdaptiveState)
    watchApperance.setTitleOffset(insets: defaultOffset, state: kDefaultAdaptiveState)
    watchApperance.setImageInsets(insets: defaultImageModeInsets, state: kImageAdaptiveState)
    
    
    let userApperance = AdaptiveButtonAppearance()
    userApperance.setAllCommonApperanceFrom(adaptiveButtonApperance: watchApperance)
    userApperance.setButonTitle(title: "user", state: kDefaultAdaptiveState)
    userApperance.setButonTitle(title: "", state: kImageAdaptiveState)
    userApperance.setImageNamesForStatesImageExtesions(imageName: "man", imageExtensionsForState: imageExtensionsForStates)
    
    
    let messageApperance = AdaptiveButtonAppearance()
    messageApperance.setAllCommonApperanceFrom(adaptiveButtonApperance: watchApperance)
    messageApperance.setButonTitle(title: "message", state: kDefaultAdaptiveState)
    messageApperance.setButonTitle(title: "", state: kImageAdaptiveState)
    messageApperance.setImageNamesForStatesImageExtesions(imageName: "messages", imageExtensionsForState: imageExtensionsForStates)
    
    
    let menuApperance = AdaptiveButtonAppearance()
    menuApperance.setAllCommonApperanceFrom(adaptiveButtonApperance: watchApperance)
    menuApperance.setButonTitle(title: "dial", state: kDefaultAdaptiveState)
    menuApperance.setButonTitle(title: "", state: kImageAdaptiveState)
    menuApperance.setImageNamesForStatesImageExtesions(imageName: "menu", imageExtensionsForState: imageExtensionsForStates)
    
    
    let moreApperance = AdaptiveButtonAppearance()
    moreApperance.setAllCommonApperanceFrom(adaptiveButtonApperance: watchApperance)
    moreApperance.setButonTitle(title: "more", state: kDefaultAdaptiveState)
    moreApperance.setButonTitle(title: "", state: kImageAdaptiveState)
    moreApperance.setImageNamesForStatesImageExtesions(imageName: "more", imageExtensionsForState: imageExtensionsForStates)
    
    return [watchApperance, messageApperance, userApperance, menuApperance, moreApperance]
    
  }
  
  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
  }
  
  func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }
  
  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
  }
  
  func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }
  
  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }
}


import UIKit
import Magic
import RealmSwift

class LocationsList: UITableViewController {
  
  let locations = realm.objects(Location.self)
  var selectedLocation: Location?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return locations.count
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "locationIdentifier", for: indexPath)
    
    cell.detailTextLabel?.text = locations[indexPath.row].name
    
    return cell
  }
  
//  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    
//    let location = locations[indexPath.row]
//    let vc = storyboard?.instantiateViewController(withIdentifier: "LocationScreen") as! LocationScreen
//    
//    vc.locationName.text = location.name
//    
//    performSegue(withIdentifier: "toLocationScreen", sender: self)
//  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let locationName = locations[indexPath.row].name
    performSegue(withIdentifier: "toLocationScreen", sender: locationName)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let destination = segue.destination as? LocationScreen {
      
      if let locationName = sender as? String {
        destination.locationName?.text = locationName
      } else {
        destination.locationName?.text = "wtf!!!!!"
      }
      
    }
  }
  
//  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    let categoryTitle = categories[indexPath.row].title
//    performSegue(withIdentifier: "toCategory", sender: categoryTitle)
//  }

//  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    if let destination = segue.destination as? CategoryVC {
//      if let categoryTitle = sender as? String {
//        destination.categoryTitle = categoryTitle
//      } else {
//        destination.categoryTitle = "Undefined category"
//      }
//    }
//  }
  
}

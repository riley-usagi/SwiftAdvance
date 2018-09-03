import UIKit
import Magic
import RealmSwift

class LocationsList: UITableViewController {
  
  let locations = realm.objects(Location.self)
  var selectedLocation: Location?
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return locations.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath)
    
    cell.detailTextLabel?.text = locations[indexPath.row].name
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let location = locations[indexPath.row]
    performSegue(withIdentifier: "toLocationSegue", sender: location)
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if let destination = segue.destination as? LocationScreen {

      if let selectedLocation = sender as? Location {
        destination.location = selectedLocation
      }
    }
  }
}


import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var ErrorLabel: UILabel!
    var lm = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        lm.delegate = self
        lm.desiredAccuracy = kCLLocationAccuracyBest
        lm.requestAlwaysAuthorization()
        lm.startUpdatingLocation()
        locationLabel.text = "BLANK"
        ErrorLabel.text = "BLANK"
        statusLabel.text = "BLANK"
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        NSLog("Auth = is \(status.rawValue)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        NSLog("Location is \(locations)")
        locationLabel.text = "\(locations.last)"
        statusLabel.text = "LOCATION FOUND"
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        NSLog("Location error is \(error)")
        ErrorLabel.text = "Location error \(error)"
        if error.localizedDescription == "The operation couldn’t be completed. (kCLErrorDomain error 0.)" {
            statusLabel.text = "ERROR FOUND"
        } else {
            statusLabel.text = "WRONG ERROR"
        }
        
    }
}


import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var darkModeSwitch: UISwitch!
    
    @IBAction func darkModeSwitch(_ sender: UISwitch) {
        if sender.isOn {              overrideUserInterfaceStyle = .dark
            } else {
              overrideUserInterfaceStyle = .light
            }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        darkModeSwitch.isOn = traitCollection.userInterfaceStyle == .dark
    }
}

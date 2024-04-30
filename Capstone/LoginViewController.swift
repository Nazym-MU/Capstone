import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var toSignUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let username = usernameTextField.text, !username.isEmpty else {
            print("Please enter a username.")
            return
        }
        guard let password = passwordTextField.text, !password.isEmpty else {
            print("Please enter a password.")
            return
        }
        print("The username is \(username)")
                usernameTextField.text = ""
                passwordTextField.text = ""
        performSegue(withIdentifier: "loggedInSegue", sender: nil)
    }
    
    @IBAction func toSignUpButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "toSignUpSegue", sender: nil)
    }
}

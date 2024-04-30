import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var toLoginButton: UIButton!
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        guard let username = usernameTextField.text, !username.isEmpty else {
                    print("Please enter a username.")
                    return
                }
        guard let email = emailTextField.text, !email.isEmpty else {
                    print("Please enter an email.")
                    return
                }
        guard let password = passwordTextField.text, !password.isEmpty else {
                    print("Please enter a password.")
                    return
                }
        guard let confirm = confirmTextField.text, !confirm.isEmpty else {
                    print("Please confirm your email.")
                    return
                }
        if password != confirm {
                print("Passwords do not match.")
            } else {
                print("Registration successful:")
                print("Username: \(username)")
                print("Email: \(email)")
            }
        usernameTextField.text = ""
        emailTextField.text = ""
        passwordTextField.text = ""
        confirmTextField.text = ""
        performSegue(withIdentifier: "signedUpSegue", sender: nil)
    }
    
    @IBAction func toLoginButton(_ sender: UIButton) {
        performSegue(withIdentifier: "toLoginSegue", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

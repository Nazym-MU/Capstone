import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBAction func didTapFavoriteButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            event.addToFavorites()
        } else {
            event.removeFromFavorites()
        }
    }
    
    var event: Event!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = event.title
        
        priceLabel.text = "KZT \(event.price)"
        descriptionTextView.text = event.description
        
        dateLabel.text = DateFormatter.localizedString(from: event.date, dateStyle: .short, timeStyle: .short)
        favoriteButton.layer.cornerRadius = favoriteButton.frame.width / 2
        
        let favorites = Event.getEvents(forKey: Event.favoritesKey)
        if favorites.contains(event) {            favoriteButton.isSelected = true
        } else {
            favoriteButton.isSelected = false
        }
    }

}

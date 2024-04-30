import UIKit

class FavoritesViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favoriteEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventCell
        let event = favoriteEvents[indexPath.row]
        cell.titleLabel.text = event.title
        cell.priceLabel.text = "$\(event.price)"
        cell.dateLabel.text = DateFormatter.localizedString(from: event.date, dateStyle: .short, timeStyle: .short)
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    var favoriteEvents: [Event] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.dataSource = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let events = Event.getEvents(forKey: Event.favoritesKey)
        self.favoriteEvents = events
        tableView.reloadData()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return }
        let selectedEvent = favoriteEvents[selectedIndexPath.row]
        guard let detailViewController = segue.destination as? DetailViewController else { return }

        detailViewController.event = selectedEvent
    }
    
}

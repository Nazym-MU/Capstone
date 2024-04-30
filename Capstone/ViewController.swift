import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventCell
        let event = events[indexPath.row]
        cell.titleLabel.text = event.title
        cell.priceLabel.text = "KZT \(event.price)"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM HH:mm"
        let dateString = dateFormatter.string(from: event.date)
        cell.dateLabel.text = dateString
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    private var events: [Event] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        self.events = mockEvents
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return }
        let selectedEvent = events[selectedIndexPath.row]
        guard let detailViewController = segue.destination as? DetailViewController else { return }

        detailViewController.event = selectedEvent
    }

}


import UIKit

class Table : UITableViewCell {
    @IBOutlet weak var nom: UILabel!
    @IBOutlet weak var can: UILabel!
}

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, HomeModelProtocol {

    @IBOutlet weak var tableView: UITableView!
    var feedItems: NSArray = NSArray()
    var selectedLocation : LocationModel = LocationModel()
    var  message : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        let homeModel = HomeModel()
        homeModel.delegate = self
        homeModel.downloadItems()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        let homeModel = HomeModel()
        homeModel.delegate = self
        homeModel.downloadItems()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func itemsDownloaded(items: NSArray) {
        
        feedItems = items
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedItems.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier: String = "cell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? Table  else {
            fatalError("Error.")
        }
        
        let item: LocationModel = feedItems[indexPath.row] as! LocationModel

        cell.nom?.text = (item.nombre)!+" :   "
        cell.can?.text = (item.cantidad)
        
        return cell
    }
}


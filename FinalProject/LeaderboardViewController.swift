import UIKit
import Firebase
import FirebaseFirestoreSwift

class LeaderboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tableViewOutlet: UITableView!
    var highScores : [PlayerScore] = []
    let database = Firestore.firestore()
    var playerShow: [PlayerScore] = []
    
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
    tableViewOutlet.delegate = self
    tableViewOutlet.dataSource = self
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        arraySetup()
        let peopleReff = database.document("people/players")
        peopleReff.getDocument { snapshot, error in
        guard let data = snapshot?.data(), error == nil else{
        return
        }
        guard let text = data["leaders"] as? [String] else {
        return
        }
        GameController.people = text
        self.arraySetup()
        self.tableViewOutlet.reloadData()
        }
        let scoreReff = database.document("score/streaks")
        scoreReff.getDocument { snapshot, error in
        guard let data = snapshot?.data(), error == nil else{
        return
        }
        guard let text = data["awesome"] as? [Int] else {
        return
        }
        GameController.scores = text
        self.arraySetup()
        self.tableViewOutlet.reloadData()
        }
        print(playerShow.count)
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return playerShow.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! GlobalCrazyCell
    cell.nameOutlet?.text = playerShow[indexPath.row].player
    cell.streakOutlet?.text = String(playerShow[indexPath.row].time)
    return cell
    }
    
    
    
    func arraySetup(){
    playerShow = []
    var x = 0
    while x < GameController.people.count{
    playerShow.append(PlayerScore.init(player:GameController.people[x], time: GameController.scores[x]))
    x += 1
    }
        
    playerShow = playerShow.sorted(by: { $0.time > $1.time })
    if playerShow.count > 10{
    var hmm = playerShow.count
    while hmm > 10{
    playerShow.remove(at: hmm - 1)
    hmm -= 1
    }
    }
    }
    
    
    
    
    
    
    
    
    }

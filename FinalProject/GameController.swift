import UIKit
import AVFoundation
import Firebase
import FirebaseFirestoreSwift
class GameController: UIViewController {
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var aoutlet: UIButton!
    @IBOutlet weak var boutlet: UIButton!
    @IBOutlet weak var coutlet: UIButton!
    @IBOutlet weak var doutlet: UIButton!
    @IBOutlet weak var eoutlet: UIButton!
    @IBOutlet weak var foutlet: UIButton!
    @IBOutlet weak var goutlet: UIButton!
    @IBOutlet weak var houtlet: UIButton!
    @IBOutlet weak var ioutlet: UIButton!
    @IBOutlet weak var joutlet: UIButton!
    @IBOutlet weak var koutlet: UIButton!
    @IBOutlet weak var loutlet: UIButton!
    @IBOutlet weak var moulet: UIButton!
    @IBOutlet weak var noutlet: UIButton!
    @IBOutlet weak var ooutlet: UIButton!
    @IBOutlet weak var poutlet: UIButton!
    @IBOutlet weak var qoutlet: UIButton!
    @IBOutlet weak var routlet: UIButton!
    @IBOutlet weak var soutlet: UIButton!
    @IBOutlet weak var toutlet: UIButton!
    @IBOutlet weak var uoutlet: UIButton!
    @IBOutlet weak var voulet: UIButton!
    @IBOutlet weak var woutlet: UIButton!
    @IBOutlet weak var xoutlet: UIButton!
    @IBOutlet weak var spaceOutlet: UIButton!
    @IBOutlet weak var youtlet: UIButton!
    @IBOutlet weak var zoutlet: UIButton!
    @IBOutlet weak var poleOutletFun: UIImageView!
    @IBOutlet weak var guessLabel: UILabel!
    
    var total = 0
    var timeRemaning: Int = 30
    var timer: Timer!
    let bruh = MasterClass.init()
    var audioPlayer: AVAudioPlayer?
    let database = Firestore.firestore()
    static var people: [String] = []
    static var scores: [Int] = []
    
    var defaultImage: [UIImage] = [
        UIImage(named: "Default1")!,
        UIImage(named: "Default2")!,
        UIImage(named: "Default3")!,
        UIImage(named: "Default4")!]
    
    var wordBank: [String] = []
    var WORDS: [String] = ["central","orange", "black", "tigers", "crystal lake", "south smells", "tiger pride", "football", "volleyball", "basketball", "baseball", "softball", "wrestling", "ben", "amelia", "brent", "activity pass", "veterans acres", "lipold park", "spirit", "squirrel", "innovative", "the freeze", "downtown", "the cottage", "ra ra ra", "aux gym", "dual credit", "four corners", "fish bowl", "math team", "computer club", "fieldhouse", "bus circle", "legacy club", "lacrosse", "canvas", "over flow", "central crazies", "interact club", "computer club", "student council", "color guard", "newspaper", "student services", "band", "choir", "musicals", "tiger buddies", "yo yos", "biology", "calculus", "physics", "chem","sus"]

    
       var special = [Character]()
       var chosen = "final"
       var number = 0
       var guesses = 0

       var put = [String]()
       var wrong = 0
       var correct = 0

   
       override func viewDidLoad() {
       super.viewDidLoad()
           
           
           let docRef = database.document("word/words")
           docRef.getDocument { snapshot, error in
           guard let data = snapshot?.data(), error == nil else{
           return
           }
           guard let wordBankk = data["allWords"] as? [String] else {
           return
           }
           self.wordBank = wordBankk
           self.settingUp()
           }
           
           
           let peopleReff = database.document("people/players")
           peopleReff.getDocument { snapshot, error in
           guard let data = snapshot?.data(), error == nil else{
           return
           }
           guard let text = data["leaders"] as? [String] else {
           return
           }
           GameController.people = text
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
           }
           
           print("amt of scire")
           print(GameController.scores.count)
           

           
           
           
           
           
           
           
           
           
           }
       
    
    func settingUp(){
        
        var num = Int.random(in: 0..<wordBank.count)
        chosen = wordBank[num]
        print("this is the word")
        print(chosen)
        makeArray(wow: chosen)
        var t = 0
        while t < special.count{
        put.append(" _ ")
        t = t + 1
        }
        var setup = ""
        var o = 0
        while o < put.count{
        setup = setup + put[o]
        o = o + 1
        }
        guessLabel.text = setup

       
        
    }
    
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(step), userInfo: nil, repeats: true)
    
        
        
    }
    
    @objc func step(){
        if timeRemaning > 0 {
        timeRemaning -= 1
        }
        if timeRemaning == 0{
        timer.invalidate()
    
        }
    }
    
    
    
    
    
    @IBAction func spaceButton(_ sender: Any) {
        
        var col  = false
        var loopAmt = 0
        for poo in special{
        if poo == " "{
        col = true
        updateGuess(guess: " ", spot: loopAmt)
        }
        loopAmt = loopAmt + 1
        }
        if col == true{
        spaceOutlet.backgroundColor = UIColor.green
        guesses = guesses + 1
        daBabyMoment()
        }
        else{
        spaceOutlet.backgroundColor = UIColor.red
        wrong = wrong + 1
        changePerson(wrongg: wrong)
        trumpMoment()
        }
        callWin()
        callLoss()
        
    }
    
    
       @IBAction func abutton(_ sender: UIButton) {
           
//           let scoreRef = database.document("word/words")
//           scoreRef.setData(["allWords": wordBank])
//           print("hello")
           var col  = false
           var loopAmt = 0
           for poo in special{
           if poo == "a"{
           col = true
           updateGuess(guess: "a", spot: loopAmt)
           }
           loopAmt = loopAmt + 1
           }
           if col == true{
           aoutlet.backgroundColor = UIColor.green
           guesses = guesses + 1
           daBabyMoment()
           }
           else{
           aoutlet.backgroundColor = UIColor.red
           wrong = wrong + 1
           changePerson(wrongg: wrong)
           trumpMoment()
           }
           callWin()
           callLoss()
           
        
        
           
       }
       
       @IBAction func bbutton(_ sender: Any) {
           var col  = false
           var loopAmt = 0
           for poo in special{
           if poo == "b"{
           col = true
           updateGuess(guess: "b", spot: loopAmt)
           }
           loopAmt = loopAmt + 1
           }
           if col == true{
           boutlet.backgroundColor = UIColor.green
           guesses = guesses + 1
           daBabyMoment()
           }
           else{
           boutlet.backgroundColor = UIColor.red
           wrong = wrong + 1
           changePerson(wrongg: wrong)
           trumpMoment()
           }
           callWin()
           callLoss()
       }
       
       @IBAction func cbutton(_ sender: Any) {
           var col  = false
           var loopAmt = 0
           for poo in special{
           if poo == "c"{
           col = true
           updateGuess(guess: "c", spot: loopAmt)
           }
           loopAmt = loopAmt + 1
           }
           if col == true{
           coutlet.backgroundColor = UIColor.green
           guesses = guesses + 1
           daBabyMoment()
           }
           else{
           coutlet.backgroundColor = UIColor.red
           wrong = wrong + 1
           changePerson(wrongg: wrong)
           trumpMoment()
           }
           callWin()
           callLoss()
       }
       
       @IBAction func dbutton(_ sender: Any) {
           var col  = false
           var loopAmt = 0
           for poo in special{
           if poo == "d"{
           col = true
           updateGuess(guess: "d", spot: loopAmt)
           }
           loopAmt = loopAmt + 1
           }
           if col == true{
           doutlet.backgroundColor = UIColor.green
           guesses = guesses + 1
           daBabyMoment()
           }
           else{
           doutlet.backgroundColor = UIColor.red
           wrong = wrong + 1
           changePerson(wrongg: wrong)
           trumpMoment()
           }
           callWin()
           callLoss()
       }
       
       @IBAction func ebuttton(_ sender: Any) {
           var col  = false
           var loopAmt = 0
           for poo in special{
           if poo == "e"{
           col = true
           updateGuess(guess: "e", spot: loopAmt)
           }
           loopAmt = loopAmt + 1
           }
           if col == true{
           eoutlet.backgroundColor = UIColor.green
           guesses = guesses + 1
           daBabyMoment()
           }
           else{
           eoutlet.backgroundColor = UIColor.red
           wrong = wrong + 1
           changePerson(wrongg: wrong)
           trumpMoment()
           }
           callWin()
           callLoss()
       }
    
       @IBAction func fbutton(_ sender: Any) {
           var col  = false
           var loopAmt = 0
           for poo in special{
           if poo == "f"{
           col = true
           updateGuess(guess: "f", spot: loopAmt)
           }
           loopAmt = loopAmt + 1
           }
           if col == true{
           foutlet.backgroundColor = UIColor.green
           guesses = guesses + 1
           daBabyMoment()
           }
           else{
           foutlet.backgroundColor = UIColor.red
           wrong = wrong + 1
           changePerson(wrongg: wrong)
           trumpMoment()
           }
           callWin()
           callLoss()
       }
       
       @IBAction func gbutton(_ sender: Any) {
           var col  = false
           var loopAmt = 0
           for poo in special{
           if poo == "g"{
           col = true
           updateGuess(guess: "g", spot: loopAmt)
           }
           loopAmt = loopAmt + 1
           }
           if col == true{
           goutlet.backgroundColor = UIColor.green
           guesses = guesses + 1
           daBabyMoment()
           }
           else{
           goutlet.backgroundColor = UIColor.red
           wrong = wrong + 1
           changePerson(wrongg: wrong)
           trumpMoment()
           }
           callWin()
           callLoss()
       }
       
       @IBAction func hbutton(_ sender: Any) {
           var col  = false
           var loopAmt = 0
           for poo in special{
           if poo == "h"{
           col = true
           updateGuess(guess: "h", spot: loopAmt)
           }
           loopAmt = loopAmt + 1
           }
           if col == true{
           houtlet.backgroundColor = UIColor.green
           guesses = guesses + 1
           daBabyMoment()
           }
           else{
           houtlet.backgroundColor = UIColor.red
           wrong = wrong + 1
           changePerson(wrongg: wrong)
           trumpMoment()
           }
           callWin()
           callLoss()
       }
       
       @IBAction func ibutton(_ sender: Any) {
           var col  = false
           var loopAmt = 0
           for poo in special{
           if poo == "i"{
           col = true
           updateGuess(guess: "i", spot: loopAmt)
           }
           loopAmt = loopAmt + 1
           }
           if col == true{
           ioutlet.backgroundColor = UIColor.green
           guesses = guesses + 1
           daBabyMoment()
           }
           else{
           ioutlet.backgroundColor = UIColor.red
           wrong = wrong + 1
           changePerson(wrongg: wrong)
           trumpMoment()
           }
           callWin()
           callLoss()
       }
       
       @IBAction func jbuttonj(_ sender: Any) {
           var col  = false
           var loopAmt = 0
           for poo in special{
           if poo == "j"{
           col = true
           updateGuess(guess: "j", spot: loopAmt)
           }
           loopAmt = loopAmt + 1
           }
           if col == true{
           joutlet.backgroundColor = UIColor.green
           guesses = guesses + 1
           daBabyMoment()
           }
           else{
           joutlet.backgroundColor = UIColor.red
           wrong = wrong + 1
           changePerson(wrongg: wrong)
           trumpMoment()
           }
           callWin()
           callLoss()
       }
       
       @IBAction func kbutton(_ sender: Any) {
           var col  = false
           var loopAmt = 0
           for poo in special{
           if poo == "k"{
           col = true
           updateGuess(guess: "k", spot: loopAmt)
           }
           loopAmt = loopAmt + 1
           }
           if col == true{
           koutlet.backgroundColor = UIColor.green
           guesses = guesses + 1
           daBabyMoment()
           }
           else{
           koutlet.backgroundColor = UIColor.red
           wrong = wrong + 1
           changePerson(wrongg: wrong)
           trumpMoment()
           }
           callWin()
           callLoss()
       }
       
       @IBAction func lbutton(_ sender: Any) {
           var col  = false
           var loopAmt = 0
           for poo in special{
           if poo == "l"{
           col = true
           updateGuess(guess: "l", spot: loopAmt)
           }
           loopAmt = loopAmt + 1
           }
           if col == true{
           loutlet.backgroundColor = UIColor.green
           guesses = guesses + 1
           daBabyMoment()
           }
           else{
           loutlet.backgroundColor = UIColor.red
           wrong = wrong + 1
           changePerson(wrongg: wrong)
           trumpMoment()
           }
           callWin()
           callLoss()
       }
       
       @IBAction func mbutton(_ sender: Any) {
           var col  = false
           var loopAmt = 0
           for poo in special{
           if poo == "m"{
           col = true
           updateGuess(guess: "m", spot: loopAmt)
           }
           loopAmt = loopAmt + 1
           }
           if col == true{
           moulet.backgroundColor = UIColor.green
           guesses = guesses + 1
           daBabyMoment()
           }
           else{
           moulet.backgroundColor = UIColor.red
           wrong = wrong + 1
           changePerson(wrongg: wrong)
           trumpMoment()
           }
           callWin()
           callLoss()
       }
       
       @IBAction func nbutton(_ sender: Any) {
           var col  = false
           var loopAmt = 0
           for poo in special{
           if poo == "n"{
           col = true
           updateGuess(guess: "n", spot: loopAmt)
           }
           loopAmt = loopAmt + 1
           }
           if col == true{
           noutlet.backgroundColor = UIColor.green
           guesses = guesses + 1
           daBabyMoment()
           }
           else{
           noutlet.backgroundColor = UIColor.red
           wrong = wrong + 1
           changePerson(wrongg: wrong)
           trumpMoment()
           }
           callWin()
           callLoss()
       }
    
       @IBAction func obutton(_ sender: Any) {
           var col  = false
           var loopAmt = 0
           for poo in special{
           if poo == "o"{
           col = true
           updateGuess(guess: "o", spot: loopAmt)
           }
           loopAmt = loopAmt + 1
           }
           if col == true{
           ooutlet.backgroundColor = UIColor.green
           guesses = guesses + 1
           daBabyMoment()
           }
           else{
           ooutlet.backgroundColor = UIColor.red
           wrong = wrong + 1
           changePerson(wrongg: wrong)
           trumpMoment()
           }
           callWin()
           callLoss()
       }
       
       @IBAction func pbutton(_ sender: Any) {
           var col  = false
           var loopAmt = 0
           for poo in special{
           if poo == "p"{
           col = true
           updateGuess(guess: "p", spot: loopAmt)
           }
           loopAmt = loopAmt + 1
           }
           if col == true{
           poutlet.backgroundColor = UIColor.green
           guesses = guesses + 1
           daBabyMoment()
           }
           else{
           poutlet.backgroundColor = UIColor.red
           wrong = wrong + 1
           changePerson(wrongg: wrong)
           trumpMoment()
           }
           callWin()
           callLoss()
       }
       
       @IBAction func qbutton(_ sender: Any) {
           var col  = false
           var loopAmt = 0
           for poo in special{
           if poo == "q"{
           col = true
           updateGuess(guess: "q", spot: loopAmt)
           }
           loopAmt = loopAmt + 1
           }
           if col == true{
           qoutlet.backgroundColor = UIColor.green
           guesses = guesses + 1
           daBabyMoment()
           }
           else{
           qoutlet.backgroundColor = UIColor.red
           wrong = wrong + 1
           changePerson(wrongg: wrong)
           trumpMoment()
           }
           callWin()
           callLoss()
       }
       
       @IBAction func rbutton(_ sender: Any) {
           var col  = false
           var loopAmt = 0
           for poo in special{
           if poo == "r"{
           col = true
           updateGuess(guess: "r", spot: loopAmt)
           }
           loopAmt = loopAmt + 1
           }
           if col == true{
           routlet.backgroundColor = UIColor.green
           guesses = guesses + 1
           daBabyMoment()
           }
           else{
           routlet.backgroundColor = UIColor.red
           wrong = wrong + 1
           changePerson(wrongg: wrong)
           trumpMoment()
           }
           callWin()
           callLoss()
       }
       
       @IBAction func sbutton(_ sender: Any) {
           var col  = false
           var loopAmt = 0
           for poo in special{
           if poo == "s"{
           col = true
           updateGuess(guess: "s", spot: loopAmt)
           }
           loopAmt = loopAmt + 1
           }
           if col == true{
           soutlet.backgroundColor = UIColor.green
           guesses = guesses + 1
           daBabyMoment()
           }
           else{
           soutlet.backgroundColor = UIColor.red
           wrong = wrong + 1
           changePerson(wrongg: wrong)
           trumpMoment()
           }
           callWin()
           callLoss()
       }
       
       @IBAction func tbutton(_ sender: Any) {
           var col  = false
           var loopAmt = 0
           for poo in special{
           if poo == "t"{
           col = true
           updateGuess(guess: "t", spot: loopAmt)
           }
           loopAmt = loopAmt + 1
           }
           if col == true{
           toutlet.backgroundColor = UIColor.green
           guesses = guesses + 1
           daBabyMoment()
           }
           else{
           toutlet.backgroundColor = UIColor.red
           wrong = wrong + 1
           changePerson(wrongg: wrong)
           trumpMoment()
           }
           callWin()
           callLoss()
       }
       
       @IBAction func ubutton(_ sender: Any) {
           var col  = false
           var loopAmt = 0
           for poo in special{
           if poo == "u"{
           col = true
           updateGuess(guess: "u", spot: loopAmt)
           }
           loopAmt = loopAmt + 1
           }
           if col == true{
           uoutlet.backgroundColor = UIColor.green
           guesses = guesses + 1
           daBabyMoment()
           }
           else{
           uoutlet.backgroundColor = UIColor.red
           wrong = wrong + 1
           changePerson(wrongg: wrong)
           trumpMoment()
           }
           callWin()
           callLoss()
       }
       
       @IBAction func vbutton(_ sender: Any) {
           var col  = false
           var loopAmt = 0
           for poo in special{
           if poo == "v"{
           col = true
           updateGuess(guess: "v", spot: loopAmt)
           }
           loopAmt = loopAmt + 1
           }
           if col == true{
           voulet.backgroundColor = UIColor.green
           guesses = guesses + 1
           daBabyMoment()
           }
           else{
           voulet.backgroundColor = UIColor.red
           wrong = wrong + 1
           changePerson(wrongg: wrong)
           trumpMoment()
           }
           callWin()
           callLoss()
       }
       
       @IBAction func wbutton(_ sender: Any) {
           var col  = false
           var loopAmt = 0
           for poo in special{
           if poo == "w"{
           col = true
           updateGuess(guess: "w", spot: loopAmt)
           }
           loopAmt = loopAmt + 1
           }
           if col == true{
           woutlet.backgroundColor = UIColor.green
           guesses = guesses + 1
           daBabyMoment()
           }
           else{
           woutlet.backgroundColor = UIColor.red
           wrong = wrong + 1
           changePerson(wrongg: wrong)
           trumpMoment()
           }
           callWin()
           callLoss()
       }
       
       @IBAction func xbutton(_ sender: Any) {
           var col  = false
           var loopAmt = 0
           for poo in special{
           if poo == "x"{
           col = true
           updateGuess(guess: "x", spot: loopAmt)
           }
           loopAmt = loopAmt + 1
           }
           if col == true{
           xoutlet.backgroundColor = UIColor.green
           guesses = guesses + 1
           daBabyMoment()
           }
           else{
           xoutlet.backgroundColor = UIColor.red
           wrong = wrong + 1
           changePerson(wrongg: wrong)
           trumpMoment()
           }
           callWin()
           callLoss()
       }
       
       @IBAction func ybutton(_ sender: Any) {
           var col  = false
           var loopAmt = 0
           for poo in special{
           if poo == "y"{
           col = true
           updateGuess(guess: "y", spot: loopAmt)
           }
           loopAmt = loopAmt + 1
           }
           if col == true{
           youtlet.backgroundColor = UIColor.green
           guesses = guesses + 1
           daBabyMoment()
           }
           else{
           youtlet.backgroundColor = UIColor.red
           wrong = wrong + 1
           changePerson(wrongg: wrong)
           trumpMoment()
           }
           callWin()
           callLoss()
       }
       
       @IBAction func zbutton(_ sender: Any) {
           var col  = false
           var loopAmt = 0
           for poo in special{
           if poo == "z"{
           col = true
           updateGuess(guess: "z", spot: loopAmt)
           }
           loopAmt = loopAmt + 1
           }
           if col == true{
           zoutlet.backgroundColor = UIColor.green
           guesses = guesses + 1
           daBabyMoment()
           }
           else{
           zoutlet.backgroundColor = UIColor.red
           wrong = wrong + 1
           changePerson(wrongg: wrong)
           trumpMoment()
           }
           callWin()
           callLoss()
       }
       
//=======================functions==========================================
      
    //losing alert
    func alertMoment(){
        let alert = UIAlertController(title: "You Lost Your Streak!", message: "The word was  \(chosen). Enter your name to send your streak to global leader board.", preferredStyle: .alert);            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Send", style: .default, handler: { [self] ale in
                guard let fields = alert.textFields, fields.count == 1 else{
                return
                }
                let person = fields[0]
                GameController.people.append(person.text!)
                
        
                let peopleRef = database.document("people/players")
                    peopleRef.updateData(["leaders": GameController.people])
                    
                
                
            }))
        
        
        alert.addTextField { field in
        field.placeholder = "name"
        field.returnKeyType = .next
        field.keyboardType = .default
        }
        present(alert, animated: true)
        resetScreen()
        
        }

   //winning alert
    func otherAlertMoment(){
        let epic = UIAlertController(title: "Coreect!.", message: "You got the word right, the word was \(chosen)." , preferredStyle: .alert)
        let gamer = UIAlertAction(title: "Okay", style: .default, handler: nil)
        epic.addAction(gamer)
        present(epic, animated: true, completion: nil)
        resetScreen()
        }
    
    
      //making array of characters
      func makeArray(wow: String){
          var g = 0
          for character in wow{
          special.append(character)
          print(special[g])
          g = g + 1
          }
       }
    
    //updating bottom label
       func updateGuess(guess: Character, spot: Int){
           var x = 0
           var inString = ""
           correct = correct + 1
           print(spot)
           put.remove(at:spot)
           put.insert(String(guess), at: spot)
           while x < put.count{
           inString = inString + put[x]
           x = x + 1
           print(inString)
           }
           print(inString)
           guessLabel.text = inString
       }
        
    //checking to see if there was a win
    func callWin(){
        print("inside")
        print(correct)
        print(chosen.count)
        if correct == chosen.count{
        total = total + 1
        otherAlertMoment()
        scoreLabel.text = " Streak: \(total)"
        resetScreen()
        }
    }
    
    //checking if there was a loss
    func callLoss(){
        print("inside")
        if wrong == 5{
        GameController.scores.append(total)
        alertMoment()
        let scoreRef = database.document("score/streaks")
        scoreRef.updateData(["awesome": GameController.scores])
        total = 0
        scoreLabel.text = " Streak: \(total)"
        }
    }
    
    
    //changing person
    func changePerson(wrongg: Int){
        var hello = MasterClass.character
        print(MasterClass.character)
        print("printed var")
        if wrongg == 5{}
        else {
        var imagee = defaultImage[wrongg - 1]
        poleOutletFun.image = imagee
        }
    }
           
    //reseting screen
    func resetScreen(){
        var num = Int.random(in: 0..<wordBank.count)
        poleOutletFun.image = UIImage(named: "pole")
        chosen = wordBank[num]
        print("this is the word")
        print(chosen)
        special.removeAll()
        makeArray(wow: chosen)
        wrong = 0
        correct = 0
        guesses = 0
        var t = 0
        put.removeAll()
        while t < special.count{
        put.append(" _ ")
        t = t + 1
        }
        var setup = ""
        var o = 0
        while o < put.count{
        setup = setup + put[o]
        o = o + 1
        }
        guessLabel.text = setup
        aoutlet.backgroundColor = UIColor.black
        boutlet.backgroundColor = UIColor.black
        coutlet.backgroundColor = UIColor.black
        doutlet.backgroundColor = UIColor.black
        eoutlet.backgroundColor = UIColor.black
        foutlet.backgroundColor = UIColor.black
        goutlet.backgroundColor = UIColor.black
        houtlet.backgroundColor = UIColor.black
        ioutlet.backgroundColor = UIColor.black
        joutlet.backgroundColor = UIColor.black
        koutlet.backgroundColor = UIColor.black
        loutlet.backgroundColor = UIColor.black
        moulet.backgroundColor = UIColor.black
        noutlet.backgroundColor = UIColor.black
        ooutlet.backgroundColor = UIColor.black
        poutlet.backgroundColor = UIColor.black
        qoutlet.backgroundColor = UIColor.black
        routlet.backgroundColor = UIColor.black
        soutlet.backgroundColor = UIColor.black
        toutlet.backgroundColor = UIColor.black
        uoutlet.backgroundColor = UIColor.black
        voulet.backgroundColor = UIColor.black
        woutlet.backgroundColor = UIColor.black
        xoutlet.backgroundColor = UIColor.black
        youtlet.backgroundColor = UIColor.black
        zoutlet.backgroundColor = UIColor.black
        spaceOutlet.backgroundColor = UIColor.black
    }
    
    //sound functions
    func trumpMoment(){
        let sound = Bundle.main.path(forResource: "donald-trump-wrong-sound-effect", ofType: "mp3")!
        let url = URL(fileURLWithPath: sound)
        do{
        audioPlayer = try AVAudioPlayer(contentsOf: url)
        audioPlayer?.play()
        } catch{
        print("error")
        }
    }
    func daBabyMoment(){
        let sound = Bundle.main.path(forResource: "DA BABY LET'S GO - Sound Effect", ofType: "mp3")!
        let url = URL(fileURLWithPath: sound)
        do{
        audioPlayer = try AVAudioPlayer(contentsOf: url)
        audioPlayer?.play()
        } catch{
        print("error")
        }
    }
    
    
    
    
}

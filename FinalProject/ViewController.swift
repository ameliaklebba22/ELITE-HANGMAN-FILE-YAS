//hello my name is amelia
import UIKit

//THIS IS THE NEW VERSION

import AVFoundation
class ViewController: UIViewController {
//this is a comment lmao - BennyBoy
    var audioPlayer: AVAudioPlayer?
    let bro = MasterClass.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    
    //Plays audio if user shakes phone
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            bro.updateCurrency(count: 250)
            let sound = Bundle.main.path(forResource: "trollface-smile", ofType: "mp3")!
            let url = URL(fileURLWithPath: sound)
            
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            }catch{
                print("error!")
            }
        }
    }

}


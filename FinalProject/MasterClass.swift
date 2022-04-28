import Foundation
import UIKit
public class MasterClass{
    static var currency : Int = 0
    static var character: Int = 0
    var current: Int = 0
    
    func updateCurrency(count: Int){
        MasterClass.currency += 10 * count
        //update Labels?
    }
    
    func returnUpdatedCurrency(count: Int) -> Int{
        return 10 * count
    }
    
    func changeCurrency(subtract: Int){
        MasterClass.currency = MasterClass.currency - subtract
        //update Labels
    }
    
    func returnCurrency() -> Int{
        return MasterClass.currency
    }
    
    func changeCharacter(new: Int){
        MasterClass.character = new
    }
    
    
    func returnCharacter() -> Int{
        return MasterClass.character
    }
    
    func saveData(saved: Int){
        MasterClass.currency = saved
    }
}

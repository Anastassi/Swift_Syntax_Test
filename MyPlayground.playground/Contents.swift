import UIKit

enum Voice {
    case low
    case midle
    case higt
}

protocol RunningCreature {
    var runningSpeed: Int { get }
    var numberPaws: Int { get }
    var creatureIsRunning: Bool { get set }
    func run()
    func stop()
}

protocol SpeakingCreature {
    associatedtype Voice
    func stirUp()
    func speak()
}



class Human {
    
    class FullName {
        var name: String
        var surname: String
        var secondName: String
        
        init(name: String, surname: String, secondName: String) {
            self.name = name
            self.surname = surname
            self.secondName = secondName
        }
        
    }
    
    var age: Int {
        get {
            return self.age
        }
        set {
            if newValue != self.age, newValue > 0 {
                newValue
            }
        }
    }
    
    var adult: Bool {
        get {
            return self.adult
            }
        set {
            if age >= 18 {
                self.adult = true
            }
        }
    }
    
    init(name: Human, age: Int) {
        self.age = age
    }
}

class Animal {
    private var isHerbivorous: Bool
    private var name: String
    class var numberOfInstances: Int {
    }
    
}




 


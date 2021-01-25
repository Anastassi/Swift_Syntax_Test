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
    var selfVoice: Voice { get }
    func mute()
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
    private(set) var isHerbivorous: Bool
    private(set) var name: String
    class var numberOfInstances: Int {
        return self.numberOfInstances
    }
    init(isHerbivorous: Bool, name: String) {
        self.isHerbivorous = isHerbivorous
        self.name = name
    }
    
    class func printInfoAboutAnimal(name: Animal, isHerbivorous: Animal) {
        print("Animal name is \(name), is herbivorous \(isHerbivorous)")
    }
}

class Tiger: Animal, RunningCreature {
    var runningSpeed: Int
    var numberPaws: Int
    var creatureIsRunning: Bool = true
    override class var numberOfInstances: Int {
        return self.numberOfInstances
    }
    
    init(runningSpeed: Int, numberPaws: Int) {
        super.init(isHerbivorous: false, name: "")
        self.runningSpeed = runningSpeed
        self.numberPaws = numberPaws
    }
    
    func run() {
        if creatureIsRunning == true {
            print("Tiger is already running")
        } else {
            creatureIsRunning = true
            print("Tiger is running - \(creatureIsRunning)")
        }
        
    }
    
    func stop() {
        if creatureIsRunning == false {
            print("Tiger is already stopped")
        } else {
            creatureIsRunning = false
            print("Tiger is running - \(creatureIsRunning)")
        }
    }
    override class func printInfoAboutAnimal(name: Animal, isHerbivorous: Animal) {
        print("!!!!!!!!!Дописать")
    }
    
    func eatanAnimal() {
        //        if let animal as? Tiger {
        //            print("My fluffiness is \(monster.fluffinessLevel)")    } else {print("I'm not fluffy at all")    }}
        //        print()
        //    }
    }
}

class Parrot: Animal, SpeakingCreature {
    var selfVoice: Voice
    var parrotIsMute: Bool = true
    
    init(selfVoice: Voice) {
        self.selfVoice = selfVoice
        super.init(isHerbivorous: false, name: name)
    }
    
    func mute() {
        if parrotIsMute == true {
            print("Parrot is already mute")
        } else {
            parrotIsMute == true
        }
    }
    
    func speak() {
        if parrotIsMute == true {
            print("Parrot is mute")
        } else {
            print("Karrrr")
        }
        parrotIsMute = false
    }
    
}

final class Zoo {
    private (set) var arrayGuests: Array<Int> = []
    private (set) var totalNumberOfVisitors: Int = 0 {
        willSet {
            print("I'm so happy to see all of us")
        }
    }
    let maxNumberOfAnimals: Int
    var zooName: String = ""
    var arrayAnimals: [Animal] = []
    
    init(maxNumberOfAnimals: Int, totalNumberOfVisitors: Int) {
        self.maxNumberOfAnimals = maxNumberOfAnimals
        self.totalNumberOfVisitors = totalNumberOfVisitors
    }
    
    init(zooName: String, maxNumberOfAnimals: Int){
        self.zooName = zooName
        self.maxNumberOfAnimals = Int.random(in: 10...100)
    }
    
    func addAnimal(newAnimal: Animal) {
        if arrayAnimals.count < maxNumberOfAnimals {
            arrayAnimals.append(newAnimal)
        } else {
            print("So many animals!")
        }
    }
}
    











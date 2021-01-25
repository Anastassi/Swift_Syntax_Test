// 1
protocol RunningCreature {
    var runningSpeed: Int { get }
    var numberOfPaws: Int { get }
    var creatureRunning: Bool { get set }
    
    func run()
    
    func stop()
}

//2
enum Tone {
    case low, medium, high
}

protocol SpeakingCreature {
    var voice: Tone { get }
    var isMuted: Bool { get set }
    
    func stirUp()
    
    func talk()
}

//3
class People {
    enum Name {
        case name, surname, patronymic
    }
    
    var age: Int {
        get {
          self._age
        }
        set {
          if newValue >= 0 && newValue != self.age {
            self._age = newValue
          }
        }
      }
    
    private var _age: Int = 0
    
    var adult: Bool {
        get {
          self.adult
        }
        set {
          if age > 18 {
            self._adult = true
          }
        }
      }
      var _adult = true
    
    func happyBirthdayAction(age: Int) -> Void {
        print(age)
    }
    
}

//4
class Animal {
    private(set) var isHerbivorous: Bool
    private(set) var name: String
    
    static var numberOfInstances: Int = 300
    
    init(isHerbivorous: Bool, name: String) {
        self.isHerbivorous = isHerbivorous
        self.name = name
    }
    
    class func informationAnimal() {
        print(Animal.init(isHerbivorous: true, name: "Lala"))
    }
}
Animal.informationAnimal()

//5
class Tiger: Animal, RunningCreature {
    var runningSpeed: Int = 100
    var numberOfPaws: Int = 4
    var creatureRunning: Bool = true
    
    func run() {
        if !self.creatureRunning {
          self.creatureRunning
          print("Run!")
        }
    }
    
    func stop() {
        if self.creatureRunning {
          !self.creatureRunning
          print("Stop!")
        }
    }
}


//Создайте сущность Parrot, которая является животным и умеет говорить (подчиняется соответствующему протоколу). Реализуйте все свойства и функции, которые необходимо. Попугай разговаривает, только если он не замючен. И мутиться, только если он до этого был размьючен.
//переопределите свойство numberOfInstances с соответствующим количеством попугаев по всему миру
//6
class Parrot: Animal, SpeakingCreature {
    var voice: Tone = .medium
    var isMuted: Bool = false
    
    func stirUp() {
        if self.isMuted
    }
    
    func talk() {
        <#code#>
    }
    
    
}


//7
class Zoo {
    private(set) maxNumberOfAnimals: Int
    private(set) nameZoo : String
    
    var totalNumberOfVisitors: Int
    
}

import Foundation

enum Voice {
    case low, medium, high
}

protocol RunningCreature {
    var runningSpeed: Int { get }

    var numberOfPaws: Int { get }
    var isRunning: Bool { get set }

    func run()
    func stop()
}

protocol SpeakingCreature {
    var voice: Voice { get }
    var isMuted: Bool { get set }

    func speak()
    func mute()
}

class Person {
    struct Name {
        let name: String
        let surname: String
        let patronymic: String
    }

    let name: Name

    var happyBirthdayAction: (Int) -> Void

    var age: Int {
        get {
            self._age
        }
        set {
            if newValue > 0, newValue != self._age {
                self._age = newValue
            }
        }
    }
    private var _age: Int = 0 {
        didSet {
            self.happyBirthdayAction(_age)
        }
    }

    var isAdult: Bool {
        return self._age > 18
    }

    init(name: Name) {
        self.name = name
        self.happyBirthdayAction = { age in
            print("Happy \(age)!")
        }
    }
}

class Animal {
    class var numberOfInstances: Int {
        return 0
    }

    let isHerbivorous: Bool
    let name: String

    init(isHerbivorous: Bool, name: String) {
        self.isHerbivorous = isHerbivorous
        self.name = name
    }

    class func printInfo() {
        print("I'm animal. I'm in \(self.numberOfInstances) instances.")
    }
}

class Tiger: Animal, RunningCreature {
    override class var numberOfInstances: Int {
        return 1000
    }

    let numberOfPaws: Int = 4

    var runningSpeed: Int = 250
    var isRunning: Bool = false

    override class func printInfo() {
        super.printInfo()

        print("I'm also Tiger. RRRRR!")
    }

    func run() {
        guard !self.isRunning else { return  }
        self.isRunning = true
        print("I'm running. My speed is \(self.runningSpeed)!")
    }

    func stop() {
        guard self.isRunning else { return }
        self.isRunning = false
        print("I've stopped")
    }

    func eat(animal: Animal) {
        guard !(animal is Tiger) else { return }
        if let runningAnimal = animal as? RunningCreature,
           runningAnimal.runningSpeed < self.runningSpeed {
            print("I've eaten \(animal.name)")
        }
    }
}

class Parrot: Animal, SpeakingCreature {
    override class var numberOfInstances: Int {
        return 5000
    }

    var voice: Voice = .high
    var isMuted: Bool = false

    func speak() {
        if !self.isMuted {
            print("I'm speaking or singing. Don't know yet. But I'm annoying, yeeh.")
        }
    }

    func mute() {
        if !self.isMuted {
            self.isMuted = true
        }
    }
}

final class Zoo {
    let maxNumberOfAnimals: Int
    let name: String

    private(set) var animals: [Animal] = [] {
        didSet {
            self.printZooInfo()
        }
    }
    private(set) var visitors: [Person] = [] {
        didSet {
            self.printZooInfo()
        }
    }

    private(set) var totalNumberOfVisitors: Int = 0 {
        willSet {
            print("We are so happy to see you, \(self.newVisitorsNames.joined(separator: ", ")) among our \(newValue) visitors")
            self.newVisitorsNames = []
        }
    }

    private var newVisitorsNames: [String] = []

    var animalsCount: Int {
        return self.animals.count
    }

    init(name: String) {
        self.maxNumberOfAnimals = Int.random(in: 5...100)
        self.name = name
    }

    init(maxNumberOfAnimals: Int, name: String) {
        self.maxNumberOfAnimals = maxNumberOfAnimals
        self.name = name
    }

    func add(animal: Animal) -> String? {
        var error: String?
        if self.maxNumberOfAnimals - self.animalsCount > 0 {
            self.animals.append(animal)
        } else {
            error = "Can't add new \(animal.name)"
        }

        return error
    }

    func add(visitor: Person) {
        self.visitors.append(visitor)
        self.newVisitorsNames = [visitor.name.name]
        self.totalNumberOfVisitors += 1
    }

    func add(visitors: [Person]) {
        for visitor in visitors {
            self.newVisitorsNames.append(visitor.name.name)
        }
        self.visitors.append(contentsOf: visitors)
        self.totalNumberOfVisitors += visitors.count
    }

    func removeAllAdults() {
        for (index, visitor) in self.visitors.enumerated() {
            if visitor.isAdult {
                self.visitors.remove(at: index)
            }
        }
    }

    func removeAllTigers() {
        for (index, animal) in self.animals.enumerated() {
            if animal is Tiger {
                self.animals.remove(at: index)
            }
        }
    }

    func feedTigers() {
        for animal in self.animals {
            if let tiger = animal as? Tiger,
               let randomAnimal = self.animals.randomElement() {
                tiger.eat(animal: randomAnimal)
            }
        }
    }

    private func printZooInfo() {
        print("""
            Zoo \(self.name) welcomes you!
            We have accepted \(self.totalNumberOfVisitors) of visitors.
            Our zoo has \(self.animals.count) animals and \(self.visitors.count) visitors at the moment.
            """)
    }
}

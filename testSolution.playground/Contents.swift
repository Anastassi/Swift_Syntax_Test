import UIKit

/*
 1. Создайте протокол RunningCreature, в котором будут следующие свойства и функции:
 скорость бега (только на чтение)
 количество лап (только на чтение)
 признак бежит ли существо (на чтение и на запись)
 функция бежать
 функция остановиться
 
 2. Создайте протокол SpeakingCreature, в котором будут следующие свойства и функции:
 голос (низкий / средний / высокий). Только на чтение
 isMuted (лишен ли голоса). На чтение и на запись
 функция замутить
 функция говорить
 
 3. Создайте сущность Человек со следующим функционалом (подумайте что выбрать перечисление / класс / структура):
 имя (вложенная сущность, в которой есть имя, фамилия и отчество). Невозможно изменить
 возраст. Можно изменить извне после проверки на то, что новое значение возраста не равно текущему и больше нуля.
 признак взрослый ли человек: вычисляемое свойство
 замыкание happyBirthdayAction, которое вызывается после того, как вы установили новое значение возраста. Принимает возраст и ничего не возвращает
 инициализатор, который принимает сущность имени человека. А также проинициализируйте замыкание, которое должно поздравлять человека с днем рождения и его новым возрастом
 
 4. Создайте сущность Animal (подумайте что выбрать перечисление / класс / структура):
 признак isHerbivorous (травоядное животное или нет). Невозможно изменить
 имя. Невозможно изменить
 переменная класса numberOfInstances (примерное количество животных этого типа по всему миру). Доступно к переопределению
 инициализатор для травоядности и имени
 классовая функция вывода информации о животном (все доступные свойства)
 
 5. Создайте сущность Tiger, которая должна реализовывать функционал сущности Animal и подчиняться протоколу RunningCreature
 переопределите свойство numberOfInstances с соответствующим количеством тигров по всему миру
 реализуйте функцию бежать и остановиться . Соответствующие действия выполняются, меняя флаг isRunning, и выводя в консоль информацию о том, что Тигр делает. Обратите внимание, что если тигр уже бежит, то тело функции выполниться не должно. Аналогично и с остановиться
 переопределите функцию вывода информации о классе, добавив туда что-нибудь о Тигре
‼️ реализуйте функцию съесть животное, которое ест животное только если оно не тигр. А если животное умеет бегать (подчиняется RunningCreature), то его скорость бега должна быть меньше скорости тигра. Выведите информацию о том, кого съел Тигр.
 
 6. Создайте сущность Parrot, которая является животным и умеет говорить (подчиняется соответствующему протоколу). Реализуйте все свойства и функции, которые необходимо. Попугай разговаривает, только если он не замючен. И мутиться, только если он до этого был размьючен.
 переопределите свойство numberOfInstances с соответствующим количеством попугаев по всему миру
 
 7. Создайте сущность Зоопарк. Недоступна к наследованию.
 maxNumberOfAnimals. Неизменяемое свойство
 имя зоопарка. Неизменяемое свойство
 totalNumberOfVisitors. Сколько всего посетителей пришло в зоопарок за всё его время существования. Доступно только для чтения извне. Перед изменением выведите консоль о том как рады вы, что к вам пришли посетители, обратившись к ним по имени.
 массив животных. По умолчанию пустой, недоступен к изменению извне.
 массив посетителей. По умолчанию пустой. Доступен только на чтение извне
 инициализатор с максимальным количеством животных и именем зоопарка
 инициализатор с именем зоопарка. максимальное количество животных - случайное значение.
 функция добавить животное. Добавляет новое животное, только если не превышено maxNumberOfAnimals. Если добавить животное не удалось, то возвращает строку с причиной неуспеха.
 функиция добавить посетителя. Добавляет посетителя.
 функция добавить посетителей. Добавляет несколько посетителей.
 функция удалить всех взрослых из посетителей. Удаляет только тех посетителей, которые старше 18.
 функция удалить всех тигров. Удаляет тигров из массива животных
 функция инфо о зоопарке. Недоступна извне. Выведите информацию о зоопарке, сколько животных в зоопарке, сколько посетителей, сколько всего посетителей было. Функция вызывается каждый раз, когда происходят изменения с животными или посетителями.
 функция покормить львов. Кормит всех львов, которые есть в зоопарке. Еда выбирается случайным образом из массива животных зоопарка.
 */

enum VoiceType {
    case low, medium, high
}

// Задание №1
protocol RunningCreature {
    var runningSpeed: Double { get }
    var pawsNumber: Int { get }
    var isItRunning: Bool { get set }
    
    func toRun()
    func stay()
}

// Задание №2
protocol SpeakingCreature {
    var voice: VoiceType { get }
    var isMuted: Bool { get set }
    
    func mute()
    func speak()
}

// Задание №3
class Human {
    enum Name: String {
        case alexanderVasilievichKapchuk
    }
    
    private(set) var name: Name = .alexanderVasilievichKapchuk
    
    let happyBirthdayAction = { (age: Int) -> Void in
        print("Happy Birthday!")
    }
    
    // Вспомогательное свойство
    static let minimalAge = 0
    
    var age: Int = 0 {
        didSet {
            if oldValue == self.age {
                print("Error, same age. Repeat please.")
            } else if self.age < 0 {
                print("The value cannot be negative")
                self.age = Human.minimalAge
            }
            happyBirthdayAction(self.age)
        }
    }
    
    var isAdult: Bool {
        if age < 21 {
            return false
        } else {
            return true
        }
    }
    
    init(name: Name) {
        self.name = name
    }
    
}

var sashaKapchuk = Human(name: .alexanderVasilievichKapchuk)
sashaKapchuk.age = -2
sashaKapchuk.age
sashaKapchuk.age = 0

// Задание №4
class Animal {
    class var numberOfInstances: Int {
        200
    }
    
    private(set) var isHerbivorous: Bool
    private(set) var name: String
    
    init(isHerbivorous: Bool, name: String) {
        self.isHerbivorous = isHerbivorous
        self.name = name
    }
    
    class func printInfo() {
        print("""
            Thiss class called Animal,
            average number of individuals about \(self.numberOfInstances)
            """)
    }
}

class Tiger: Animal, RunningCreature {
    override class var numberOfInstances: Int {
        100
    }
    
    var runningSpeed: Double = 200
    var pawsNumber: Int = 4
    var isItRunning: Bool = true
    
    // Не знаю как сделать проверку на скорость
    func eatAnimal(animalType: Animal) {
        if animalType is Tiger {
            print("Tigers do not eat tigers!")
        } else {
            print("The tiger ate the animal!")
        }
    }
    
    func toRun() {
        if isItRunning {
            print("Tiger already running!")
        } else {
            print("Tiger is running!")
            isItRunning = true
        }
    }
    
    func stay() {
        if !isItRunning {
            print("Tiger already stayed.!")
        } else {
            print("Tiger is stayed!")
            isItRunning.toggle()
        }
    }
    
    override class func printInfo() {
        super.printInfo()
        print("Tigers are very rare animals.")
    }
    
}

// Задание №6
class Parrot: Animal, SpeakingCreature {
    var voice: VoiceType = .high
    var isMuted: Bool = false
    
    func mute() {
        if self.isMuted {
            self.isMuted.toggle()
            print("Turned off the sound for the parrot")
        } else {
            print("Already muted")
        }
    }
    
    func speak() {
        if !self.isMuted {
            print("Parrot speaking")
        } else {
            print("Parrot muted")
        }
    }
    
    override class var numberOfInstances: Int {
        1000000
    }
    
}

var myBird = Parrot(isHerbivorous: true, name: "Kesha")
myBird.isMuted
myBird.mute()
myBird.isMuted = true
myBird.speak()


// Задание №7

class Visitor: Human {
    
}

class Zoo {
    final var maxNumberOfAnimals: Int
    private(set) var name: String
    
    // Перед изменением выведите консоль о том как рады вы, что к вам пришли посетители, обратившись к ним по имени. ???
    fileprivate var totalNumberOfVisitors: Int = 190000 {
        willSet {
            print("We are very glad that you came")
        }
    }
    
    fileprivate var animals: [Animal] = []
    fileprivate var visitors: [Visitor] = []
    
    init(name: String, maxNumberOfAnimals: Int) {
        self.name = name
        self.maxNumberOfAnimals = maxNumberOfAnimals
    }
    
    init(name: String) {
        self.name = name
        self.maxNumberOfAnimals = Int.random(in: 0...100000)
    }
    
    func addAnimal() {
        if self.animals.count < self.maxNumberOfAnimals {
            animals.append(Animal(isHerbivorous: false, name: "New Animal"))
        } else {
            print("Sorry! Zoo is full!")
        }
    }
    
    func addVisitors(count: Int) {
        for _ in 0...count {
            visitors.append(Visitor(name: .alexanderVasilievichKapchuk))
        }
    }
    
    func addFewVisitors(in amount: Int) {
        self.totalNumberOfVisitors += amount
    }
    
    func removeAdults() {
        var updArray: [Visitor] = []
        var adultsCounter: Int = 0
        
        for man in visitors {
            if man.age >= 18 {
                adultsCounter += 1
            } else {
                updArray.append(man)
            }
        }
        visitors = updArray
        print("Total removed \(adultsCounter) adults!")
    }
    
    func removeTigers() {
        var updArray: [Animal] = []
        var tigerCounter: Int = 0
        
        for animal in animals {
            if let _ = animal as? Tiger {
                tigerCounter += 1
            } else {
                updArray.append(animal)
            }
        }
        animals = updArray
        print("Total removed \(tigerCounter) tigers")
    }
    
    func printInfo() {
        print("""
        There are \(self.animals.count) animals in our zoo.
        For all the time we were visited by \(self.totalNumberOfVisitors) people!
        We will be glad to see yo
        """)
    }
    
    func feedLion() {
        print("The lion ate \(self.animals.randomElement()?.name ?? "Zoo is empty now.")  ")
    }
    
}

var minskZoo = Zoo(name: "Minsk Zoo", maxNumberOfAnimals: 400)

var firstParrot = Parrot(isHerbivorous: false, name: "Vasia")
var secondParrot = Parrot(isHerbivorous: false, name: "Masha")
var firstTiger = Tiger(isHerbivorous: false, name: "Rex")
var secondTiger = firstParrot

var firstVisitor = Visitor(name: .alexanderVasilievichKapchuk)
var secondVisitor = firstVisitor
secondVisitor.age = 23

firstTiger.eatAnimal(animalType: firstParrot)

// Не работает. Тигр не должен кушать тигров, ну
firstTiger.eatAnimal(animalType: secondTiger)

minskZoo.visitors.append(firstVisitor)
minskZoo.addVisitors(count: 5)
minskZoo.visitors.count

minskZoo.removeAdults()
minskZoo.visitors.count
minskZoo.addAnimal()
minskZoo.animals.append(firstTiger)
minskZoo.animals.append(secondTiger)
minskZoo.removeTigers()
minskZoo.addAnimal()
minskZoo.animals.count
minskZoo.addAnimal()
minskZoo.removeTigers()

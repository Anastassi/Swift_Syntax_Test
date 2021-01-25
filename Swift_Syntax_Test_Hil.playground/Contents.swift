import UIKit

/*
 1. Создайте протокол RunningCreature, в котором будут следующие свойства и функции:
 скорость бега (только на чтение)
 количество лап (только на чтение)
 признак бежит ли существо (на чтение и на запись)
 функция бежать
 функция остановиться
 
 ================= Solution ==================== */
 
protocol RunningCreature {
    var runningSpeed: Double { get }
    var pawQuantity: Int { get }
    var isRunning: Bool { get set }
    
    func run()
    func stop()
}
 
/*
 2. Создайте протокол SpeakingCreature, в котором будут следующие свойства и функции:
 голос (низкий / средний / высокий). Только на чтение
 isMuted (лишен ли голоса). На чтение и на запись
 функция замутить
 функция говорить
 
 ================= Solution ==================== */

enum Voice: String {
    case hi, low, middle
}

protocol SpeakingCreature {
    var voice: Voice { get }
    
    var isMuted: Bool { get set }
    
    func mute()
    func speak()
}

 /*
 3. Создайте сущность Человек со следующим функционалом (подумайте что выбрать перечисление / класс / структура):
 имя (вложенная сущность, в которой есть имя, фамилия и отчество). Невозможно изменить возраст. Можно изменить извне после проверки на то, что новое значение возраста не равно текущему и больше нуля.
 признак взрослый ли человек: вычисляемое свойство
 замыкание happyBirthdayAction, которое вызывается после того, как вы установили новое значение возраста. Принимает возраст и ничего не возвращает
 инициализатор, который принимает сущность имени человека. А также проинициализируйте замыкание, которое должно поздравлять человека с днем рождения и его новым возрастом
 
 ================= Solution ==================== */

struct Human {
    struct PersonName {
        var surname: String
        var name: String
        var patronymic: String
    }
    
    var age: Int {
        get {
            return self._age
        }
        set {
            if newValue != self.age && newValue >= 0 {
                self._age = newValue
            }
        }
    }
    private var _age: Int = 999
    
    var isAdult: Bool {
        get {
            self._isAdult
        }
        set {
            if age > 18 {
                self._isAdult = true
            }
        }
    }
    var _isAdult = true
}



 /*
 4. Создайте сущность Animal (подумайте что выбрать перечисление / класс / структура):
 признак isHerbivorous (травоядное животное или нет). Невозможно изменить
 имя. Невозможно изменить
 переменная класса numberOfInstances (примерное количество животных этого типа по всему миру). Доступно к переопределению
 инициализатор для травоядности и имени
 классовая функция вывода информации о животном (все доступные свойства)
  
 ================= Solution ==================== */

class Animal {
    private var numberOfInstances = 50000
    
    private(set) var isHerbivorous: Bool
    
    private(set) var name: String
    
    init(isHerbivorous: Bool, name: String) {
        self.isHerbivorous = isHerbivorous
        self.name = name
    }
    
    class func animalInfo() {
        print(Animal.init(isHerbivorous: true, name: "Raf"))
    }
}

Animal.animalInfo()

/*
 5. Создайте сущность Tiger, которая должна реализовывать функционал сущности Animal и подчиняться протоколу RunningCreature
 переопределите свойство numberOfInstances с соответствующим количеством тигров по всему миру
 реализуйте функцию бежать и остановиться . Соответствующие действия выполняются, меняя флаг isRunning, и выводя в консоль информацию о том, что Тигр делает. Обратите внимание, что если тигр уже бежит, то тело функции выполниться не должно. Аналогично и с остановиться
 переопределите функцию вывода информации о классе, добавив туда что-нибудь о Тигре
 реализуйте функцию съесть животное, которое ест животное только если оно не тигр. А если животное умеет бегать (подчиняется RunningCreature), то его скорость бега должна быть меньше скорости тигра. Выведите информацию о том, кого съел Тигр.
 
 ================= Solution ==================== */
 
class Tiger: Animal, RunningCreature {
    var runningSpeed: Double = 130
    
    var pawQuantity: Int = 4
    
    var isRunning: Bool = true
    
    func run() {
        if isRunning {
            print("I'm running")
        }
    }
    func stop() {
        if !isRunning {
            print("I'm standing")
        }
    }
}

 /*
 6. Создайте сущность Parrot, которая является животным и умеет говорить (подчиняется соответствующему протоколу). Реализуйте все свойства и функции, которые необходимо. Попугай разговаривает, только если он не замючен. И мутиться, только если он до этого был размьючен.
 переопределите свойство numberOfInstances с соответствующим количеством попугаев по всему миру
  
 ================= Solution ==================== */

class Parrot: Animal, SpeakingCreature {
    var voice: Voice = Voice.low
    
    var isMuted: Bool = false
    
    func mute() {
        if isMuted {
            print("I can't speaking")
        }
    }
    
    func speak() {
        if !isMuted {
            print("I can speaking!")
        }
    }
    
//    override var numberOfInstances: Int {
//        return 100000
//    }
    
}

/*
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
 
 ================= Solution ==================== */
 





/*
 8. Создайте разных животных и зоопарк. Создайте посетителей.
 Добавьте животных в зоопарк
 Добавьте в зоопарк посетителей.
 Покормите тигров
 Измените возраст всем посетителям, которым 17 лет.
 Удалите всех взрослых
 Удалите всех тигров
 Пройдитесь по всем животных зоопарка.
 Если это говорящее создание, то заставьте его поговорить
 Если это бегающее создание, то выведите его скорость бега
 Во всех остальных случаях выведите травоядное животное или нет
 
 ================= Solution ==================== */

//part 1
print("\n\tpart 1")
let firstPirsonTuple = (age: 10, firstName: "Mike", surname: "Wazowski", speciality: "Monster")
let secondPirsonTuple = (age: 12, firstName: "James", surname: "P. Sullivan", speciality: "Monster")
//get parameters by index
print(firstPirsonTuple.0)
print(firstPirsonTuple.1)
print(firstPirsonTuple.2)
print(firstPirsonTuple.3)
//get parameters by name
print(secondPirsonTuple.age)
print(secondPirsonTuple.firstName)
print(secondPirsonTuple.surname)
print(secondPirsonTuple.speciality)

//part 2
//2.1
print("\n\tpart 2.1")
let daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
for day in daysInMonth {
    print("It's \(day) days")
}

//2.2
print("\n\tpart 2.2")
let monthNames = ["January", "February", "March", "April", "May", "June", "Jully", "August", "September", "October", "November", "December"]
for index in 0..<monthNames.count {
    print("Month number \(index+1) is \(monthNames[index]) and it has \(daysInMonth[index]) days")
}

//2.3
print("\n\tpart 2.3")
let yearTupleArray = [(monthName: "January", daysCount: 31),
                 (monthName: "February", daysCount: 28),
                 (monthName: "March", daysCount: 31),
                 (monthName: "April", daysCount: 30),
                 (monthName: "May", daysCount: 31),
                 (monthName: "June", daysCount: 30),
                 (monthName: "Jully", daysCount: 31),
                 (monthName: "August", daysCount: 31),
                 (monthName: "September", daysCount: 30),
                 (monthName: "October", daysCount: 31),
                 (monthName: "November", daysCount: 30),
                 (monthName: "December", daysCount: 31)]
for month in yearTupleArray {
    print("\(month.monthName) has \(month.daysCount) days")
}

//2.4
print("\n\tpart 2.4")
for index in 0..<yearTupleArray.count {
    let reverseNumber = yearTupleArray.count - index - 1
    print("\(yearTupleArray[reverseNumber].monthName) has \(yearTupleArray[reverseNumber].daysCount) days")
}

//2.5
print("\n\tpart 2.5")
enum DateError: Error {
    case incorrectNomberOfDay
    case incorrectMonthName
}

func countDaysBeforeNewYear(monthName name: String, dayNumber num: Int) throws -> Int {
    var daysBeforeNewYear = 0
    if let numberOfMonth = yearTupleArray.firstIndex(where: {$0.monthName==name}) {
        if Array(1...yearTupleArray[numberOfMonth].daysCount).contains(num) {
            for index in numberOfMonth..<yearTupleArray.count {
                daysBeforeNewYear += yearTupleArray[index].daysCount
            }
            return (daysBeforeNewYear - num)
        } else {
            throw DateError.incorrectNomberOfDay
        }
    } else {
        throw DateError.incorrectMonthName
    }
}
let month = "November"
let day = 15
let days: Int
do {
    try days = countDaysBeforeNewYear(monthName: month, dayNumber: day)
    print("До конца года осталось \(days) дней от даты \(day) \(month)")
} catch DateError.incorrectMonthName {
    print("Месяца \(month) не бывает")
} catch DateError.incorrectNomberOfDay {
    print("Даты \(month) \(day) не бывает")
}


//3
print("\n\tpart 3")
var students: [String: Int] = ["Беляев": 5, "Зайцев": 1, "Романов": 3]
func changeRating(of student: String, to newRating: Int) {
    if students[student] != nil {
        if Array(1...5).contains(newRating) {
            students.updateValue(newRating, forKey: student)
            if newRating>2 {
                print("Так держать, \(student)!")
            } else {
                print("\(student), придёшь на пересдачу.")
            }
        } else {
            print("Оценки \(newRating) не бывает")
        }
    } else {
        print("Студент \(student) в списках не значится.")
    }
}
changeRating(of: "Романов", to: 2)
students["Иванченко"] = 3
students.updateValue(3, forKey: "Михно")
students.removeValue(forKey: "Зайцев")
print(students)
func countAverageratingOfTheGroup(group: [String: Int]) -> Float{
    var sum: Float = 0
    for rating in group.values {
        sum += Float(rating)
    }
    return sum/Float(group.count)
}

print("Средний бал группы: \(countAverageratingOfTheGroup(group: students)).")

func test (closure: ()->()) {
    for i in 0...10 {
        print (i)
    }
     closure()
}
test() {i in print(i)}

//MARK: Part 2


let array = [1, 3, 4, 5, 8, 34, 767, 8, 23, 23, 55, 223, 64]

func sortArray (_ s1: Int, _ s2: Int) -> Bool {
    return s1 > s2
}

var test = array.sorted(by: {(s1 : Int, s2 : Int)->Bool in
    return s1>s2})  // полная форма
var waning = array.sorted(by: >) // сокращенная фома
var test2  = array.sorted(by: {$0 > $1}) //Еще один вил сокращенной форма $0 $1 номера аргументов

var acsending = array.sorted(by: <)

//MARK: part 3  Напишите функцию, которая принимает массив интов и клоужер и возвращает инт. Клоужер должен принимать 2 инта (один опшинал) и возвращать да или нет. В самой функции создайте опшинал переменную. Вы должны пройтись в цикле по массиву интов и сравнивать элементы с переменной используя клоужер. Если клоужер возвращает да, то вы записываете значение массива в переменную. в конце функции возвращайте переменную.

func filter (_ array: [Int], f: (_ s1: Int, _ s2: Int?) -> Bool) -> Int {
    var number : Int?
    for value in array {
        if f(value, number) {
            number = value
        }
    }
return number ?? 0
}

let minArray = filter(array) {$1 == nil || $1! < $0}
print (minArray)



func filter2 (_ string: String, f: (_ s1: Character, _ s2: Character?) -> Bool) -> Character {
    var arrayString = [Character]()
    for i in string.characters{
        arrayString += [i]
    }
    
    var temp : Character?
    for i in arrayString {
        if f(i, temp) {
            temp = i
        }
    }
    return temp ?? "!"
}
let ggg = "gkjdrgdyjgkjkfaadyvbkjnkl"
let minArray2 = filter2(ggg) {$1 == nil || $1! > $0}
print(minArray2)


//MARK: Part 4 Создайте произвольную строку. Преобразуйте ее в массив букв. Используя метод массивов sorted отсортируйте строку так, чтобы вначале шли гласные в алфавитном порядке, потом согласные, потом цифры, а потом символы


let abc = "asdkwbflkjdknbksjbflkandjasdasdadafasdqwdkabskjsbjhfbtr673752te7y12ru9198e291yr87578358yo90491270123u012ry8hakkmba,scqodp[;.]q;][]1]2[;.[/]']'].][;][;[].],]./][2][32p1krpj12ir u21euhauyg%$^%$#r^^&&&"

func stingToAraay (_ string : String) -> [String] {
    var abcArray = [String]()
    for i in string.characters {
        abcArray += [String(i)]
    }
    return abcArray
}

func arrayToString (_ arrayAbc : [String]) -> String {
    var abcString = ""
    for i in arrayAbc {
        abcString += String(i)
    }
    return abcString
}

var vovel = [String]()
var consonant = [String]()
var num = [String]()
var symbol = [String]()
for i in stingToAraay(abc) {
    switch i {
    case "a", "q", "e", "y", "u", "o", "i" : vovel += [i]
    case "w", "r", "t", "p", "s", "d","f",
         "g", "h", "j","k", "l", "z", "x",
         "c", "v", "b", "n", "m" : consonant += [i]
    case "1"..."9" : num += [i]
    default : symbol += [i]
}
}

let sortedText = arrayToString(vovel.sorted(by: <)) +
    arrayToString(consonant.sorted(by: <)) +
    arrayToString(num.sorted(by: <)) +
    arrayToString(symbol.sorted(by: <))

print (sortedText)


// создание функции фильтра для нашего задания методом 2 путем кложеров
func filterAbc (string: String, clous: (String) -> Bool) -> [String] {
    var arrayed = [String]()
    var filtered = [String]()
    
    for i in string.characters {
       arrayed  += [String(i)]
    }

    for value in arrayed {
        if clous(value) {
        filtered.append(value)
        }
    }
return filtered

}
//  2й метод разлодения строки на гласные согласные итд потом тоже самое
let vovelArray = ["a", "q", "e", "y", "u", "o", "i"]
var asdasdad = [String]()
let vov1 = filterAbc(string: abc) { value in
    for include in vovelArray {
        if include == value {
           return true
        }
    }
    return false
}


// 3й метод через дикшинари менее ресурсозатраный

var dictVovel = [String:Bool]()




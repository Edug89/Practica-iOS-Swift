import UIKit

// MARK: - PRÁCTICA iOS -

// 1.- Calcular y generar una lista con los 100 primeros números primos y hacer un print de los últimos 10.
var number = 2
var primeNumbers: [Int] = []
while primeNumbers.count < 100 {
    var isPrime = true
    
    for i in 2..<number {
        if number % i == 0{
            isPrime = false
        }
    }
    if isPrime == true {
        primeNumbers.append(number)
    }
    number += 1
}
print("The first 100 prime numbers are \(primeNumbers)")
print("The last 10 numbers on our list are \(primeNumbers.suffix(10))")



// 2.- Calcular la suma de los primeros 50 números primos y hacer un print del resultado.
var sumPrimeNumbers = primeNumbers[0...49]
var sum = sumPrimeNumbers.reduce(0, +)
print("La suma de los 50 primeros numeros primos es \(sum)")



// 3.- Dada la siguiente lista, obtener todos los elementos que contengan más de dos vocales:
var players: [String] = ["Vinicius", "Messi", "Ronaldo", "Pedri", "Mbappe", "Modric", "Militao", "Morata", "Valverde", "Benzema", "Pique"]

let playersWithMoreThanTwoVowels = players.filter { (word) -> Bool in
    let vowels = CharacterSet(charactersIn: "aeiouAEIOU")
    let vowelCount = word.unicodeScalars.filter { vowels.contains($0) }.count
    return vowelCount > 2
}

print(playersWithMoreThanTwoVowels)



// 4.- Crear un enumerado que permita indicar la posición en el campo de un jugador de fútbol.
enum FooballTeam {
    case Portero
    case LateralDerecho
    case Central
    case LateralIzquierdo
    case Mediocentro
    case ExtremoDerecha
    case ExtremoIzquierda
    case Delantero
}
//Abajo adjunto ejemplo de selección:
var position = FooballTeam.Portero



// 5.- Crea una clase,con los atributos necesarios, para representar a los miembros que participan en una selección del mundial y un enumerado que los diferencia por tipo, por ejemplo: Jugador, Seleccionador, Médico

class FootballTeamMembers{
    var country: String
    var name: String
    var age: UInt
    
    init(country: String,
         name: String,
         age: UInt,
         charge: RolPosition){
        self.name = name
        self.age = age
        self.country = country
    }
}

enum RolPosition {
    case player
    case coach
    case doctor
}


// 6.-



// 7.-



// 8.-



// 9.-



// 10.-

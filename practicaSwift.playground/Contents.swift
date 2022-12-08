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
print("The sum of the first 50 prime numbers is \(sum)")



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



// 6.-Crear las clases necesarias, con los atributos mínimos, para representar las selecciones de fútbol del Mundial de fútbol 2022,por ejemplo: Una clase que represente el Mundial,necesitaremos que contenga un listado de Selecciones,cada selección tendrá sus atributos, como nombre,país,jugadores,seleccionador,etc.
class SoccerWorldCup {
    let listOfSelections: [QualifiedSelection]
    
    
    init(listOFSelections: [QualifiedSelection]) {
        self.listOfSelections = listOFSelections
        
    }
}

class QualifiedSelection{
    let continent: String
    let country: String
    let players: [Player]
    let coach: String
    
    init(continent: String, country: String, players: [Player], coach: String) {
        self.continent = continent
        self.country = country
        self.players = players
        self.coach = coach
    }
}

class Player {
    let name: String
    let lastname: String
    
    init(name: String, lastname: String) {
        self.name = name
        self.lastname = lastname
    }
}

let selections = [QualifiedSelection(continent: "Europe", country: "Spain", players: [Player(name: "Alvaro", lastname: "Morata"),Player(name: "Jordi", lastname: "Alba")], coach: "Luis Enrique"),
                  QualifiedSelection(continent: "Europe", country: "France", players: [Player(name: "Karim", lastname: "Benzema"),Player(name: "Ousmane", lastname: "Dembele")], coach: "Blanc"),
                  QualifiedSelection(continent: "Europe", country: "Germany", players: [Player(name: "Manuel", lastname: "Noyer"),Player(name: "John", lastname: "Bellindam")], coach: "Frinch"),
                  QualifiedSelection(continent: "South America", country: "Argentina", players: [Player(name: "Lionel", lastname: "Messi"),Player(name: "Di", lastname: "Maria")], coach: "Antonio"),
                  QualifiedSelection(continent: "Europe", country: "Belgium", players: [Player(name: "Edem", lastname: "Hazard"),Player(name: "Romeu", lastname: "Lukaku")], coach: "Roberto Moreno"),
                  QualifiedSelection(continent: "Africa", country: "Morroco", players: [Player(name: "Acraft", lastname: "Shulimani"),Player(name: "Adil", lastname: "Bobdam")], coach: "Pert"),
                  QualifiedSelection(continent: "Europe", country: "Holland", players: [Player(name: "Michael", lastname: "Vandic"),Player(name: "Aser", lastname: "Roben")], coach: "Koeman"),
                  QualifiedSelection(continent: "South America", country: "Brazil", players: [Player(name: "Vinicus", lastname: "Jr"),Player(name: "Rafiña", lastname: "JR")], coach: "Asier")]



var soccerWorldCup = SoccerWorldCup(listOFSelections: selections)
print(soccerWorldCup.listOfSelections[0].country)


// 7.-Crear una clase para representar los partidos entre selecciones deberá contener atributos como equipo local, visitante y resultado como mínimo. Generar una lista aleatoria de partidos entre la lista de selecciones anteriores y hacer un print de este estilo por partido: Partido España 3 - 1 Brasil

class Match {
    let localTeam: String
    let visitorTeam: String
    let result: [Int]
    
    init(localTeam: String, visitorTeam: String, result: [Int]) {
        self.localTeam = localTeam
        self.visitorTeam = visitorTeam
        self.result = result
    }
}

func matchGenerator() -> String {
    let match = Match(localTeam: selections[Int.random(in: 0..<8)].country, visitorTeam: selections[Int.random(in: 0..<8)].country, result: [Int.random(in: 0..<6), Int.random(in: 0..<6)])
    return("\(match.localTeam) \(match.result[0]) - \(match.result[1]) \(match.visitorTeam)")
}

print(matchGenerator())

// 8.-Generar de forma aleatoria,dentro de la clase Mundial,un listado de grupos con un máximo de 4 selecciones por grupo,se puede crear una clase nueva Grupo que contenga el nombre del grupo,listado de participantes y listado de partidos. Por ejemplo: Grupo A España,Brasil,Francia,Alemania
/*class Group {
    let name: String
    let teams: [String]
    let matchs: [Match]
    
    init(name: String, teams: [String], matchs: [Match]) {
        self.name = name
        self.teams = teams
        self.matchs = matchs
    }
}

func groupGenerator() -> [String] {
    let selections = [selections[Int.random(in: 0..<8)].country,
                     selections[Int.random(in: 0..<8)].country,
                     selections[Int.random(in: 0..<8)].country,
                     selections[Int.random(in: 0..<8)].country]
    return selections
}
let group1Teams = groupGenerator()
let group1 = Group(name: "A", teams: group1Teams, matchs: <#T##[Match]#>)
*/
// 9.-Para añadir a cada Grupo los puntos de cada selección habrá que contabilizar las victorias con 3 puntos, empates con 1 y derrotas con 0. Añadir una función en la clase Grupo que le pasemos una selección y nos devuelva sus puntos.



// 10.-Generar los partidos del Mundial en cada grupo y caalcular las dos primeras selecciones de cada grupo y haacer un print con los clasificados.

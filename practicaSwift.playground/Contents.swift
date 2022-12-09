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
    let listOfGroups: [Group]
    
    init(listOFSelections: [QualifiedSelection], listOfGroups: [Group]) {
        self.listOfSelections = listOFSelections
        self.listOfGroups = listOfGroups
        
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

let teamsGroupB = [selections[4], selections[5], selections[6], selections[7]]
let teamsGroupA = [selections[0], selections[1], selections[2], selections[3]]

                    
let groups = [Group(name: "Group A", participants: teamsGroupA, matches: (0..<3).map{_ in matchGenerator(teams: teamsGroupA)}), Group(name: "Group B", participants: teamsGroupB, matches: (0..<3).map{_ in matchGenerator(teams: teamsGroupB)})]

//var soccerWorldCup = SoccerWorldCup(listOFSelections: selections, listOfGroups: groups)


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



// 7.-Crear una clase para representar los partidos entre selecciones deberá contener atributos como equipo local, visitante y resultado como mínimo. Generar una lista aleatoria de partidos entre la lista de selecciones anteriores y hacer un print de este estilo por partido: Partido España 3 - 1 Brasil

class Match {
    let localTeam: String
    let visitorTeam: String
    let result: (Int, Int)
    
    init(localTeam: String, visitorTeam: String, result: (Int, Int)) {
        self.localTeam = localTeam
        self.visitorTeam = visitorTeam
        self.result = result
    }
}

func matchGenerator(teams:[QualifiedSelection]) -> Match {
    let match = Match(localTeam: teams[Int.random(in: 0..<4)].country, visitorTeam: teams[Int.random(in: 0..<4)].country, result: (Int.random(in: 0..<6), Int.random(in: 0..<6)))
    print("\(match.localTeam) \(match.result.0) - \(match.result.1) \(match.visitorTeam)")
    return match
}


// 8.-Generar de forma aleatoria,dentro de la clase Mundial,un listado de grupos con un máximo de 4 selecciones por grupo,se puede crear una clase nueva Grupo que contenga el nombre del grupo,listado de participantes y listado de partidos. Por ejemplo: Grupo A España,Brasil,Francia,Alemania
class Group {
    let name: String
    let participants: [QualifiedSelection]
    let matches: [Match]
    
    init(name: String, participants: [QualifiedSelection], matches: [Match]) {
        self.name = name
        self.participants = participants
        self.matches = matches
    }
}


// 9.-Para añadir a cada Grupo los puntos de cada selección habrá que contabilizar las victorias con 3 puntos, empates con 1 y derrotas con 0. Añadir una función en la clase Grupo que le pasemos una selección y nos devuelva sus puntos.
extension Group {
    func teamScore(team:QualifiedSelection) -> Int {
        return matches.reduce(0) { score, match in
            switch(match.localTeam, match.visitorTeam, match.result) {
            case(let localTeam, _, let result) where localTeam == team.country && result.0 > result.1:
                return score + 3
            case(let localTeam, _, let result) where localTeam == team.country && result.0 == result.1:
                return score + 1
            case( _, let visitorTeam, let result) where visitorTeam == team.country && result.0 < result.1:
                return score + 3
            case( _, let visitorTeam, let result) where visitorTeam == team.country && result.0 == result.1:       return score + 1
            default:
                return score
            }
        }
    }
}

groups[0].teamScore(team: selections[0])


// 10.-Generar los partidos del Mundial en cada grupo y calcular las dos primeras selecciones de cada grupo y hacer un print con los clasificados.


import Foundation

var pokemonStorage = PokemonStorage()

struct PokemonStorage {
    var pokemons: [PokemonModel] = []
    private let pokedexJSON = "pokedex"

    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8)
            {
                return jsonData
            }
        } catch {
            debugPrint(error)
        }

        return nil
    }

    mutating func loadPokemons() {
        do {
            if let jsonData = readLocalFile(forName: pokedexJSON) {
                pokemons = try JSONDecoder().decode([PokemonModel].self,
                                                    from: jsonData)
            }
        } catch {
            debugPrint(error)
        }
    }
}

func randomString(length: Int) -> String {
    let letters = "😺🎃👯‍♀️🗣🧠😵👯‍♂️👯🧤🩴🥾🧢🐯🐮🐭🐶🐱🐼🐽🐸🐧🐦🐒🐒🐒🐒🐒🐒🙊🙉🙈🐵🐤🐥🐣🦄🦄🦄🪲🐝🐝🪱🪱🐛🐛🦗🦖🐠🐡🦀🐍🦞😾🦾🤝"
    return String((0 ..< length).map { _ in letters.randomElement()! })
}

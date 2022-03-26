import Combine
import SwiftUI

class RefreshModel: ObservableObject {
    @Published var loading: Bool = false {
        didSet {
            if oldValue == false, loading == true {
                load()
            }
        }
    }

    @Published var pokemons: [PokemonModel] = pokemonStorage.pokemons

    var idx = 0

    func load() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            debugPrint("Refresh")
            self.pokemons = pokemonStorage.pokemons.shuffled()
            self.loading = false
        }
    }
}

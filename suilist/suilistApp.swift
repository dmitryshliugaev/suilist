import SwiftUI

@main
struct suilistApp: App {
    init() {
        pokemonStorage.loadPokemons()
    }

    var body: some Scene {
        WindowGroup {
            Main()
        }
    }
}

import SwiftUI

struct PokemonView: View {
    private let pokemonModel: PokemonModel

    init(_ pokemonModel: PokemonModel) {
        self.pokemonModel = pokemonModel
    }

    var body: some View {
        HStack(alignment: .center) {
            Image("\(pokemonModel.id)")
                .resizable()
                .frame(width: 100, height: 100)

            VStack(alignment: .leading) {
                Text("\(pokemonModel.title)")
                Text("HP \(pokemonModel.hp)")
                Text("Attack \(pokemonModel.attack)")
                Text("Defense \(pokemonModel.defense)")
                Text("Speed \(pokemonModel.speed)")
            }
        }
    }
}

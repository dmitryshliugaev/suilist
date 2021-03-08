import SwiftUI

struct VStackPerfomance: View {
    @State var pokemons = pokemonStorage.pokemons

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Button("Shuffle") {
                    pokemons.shuffle()
                }
                .padding()

                ForEach(pokemons) { pokemon in
                    PokemonView(pokemon)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding()
        }
        .navigationTitle("VStackPerfomance")
    }
}

// Overflow memory

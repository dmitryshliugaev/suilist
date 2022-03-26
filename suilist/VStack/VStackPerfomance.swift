import SwiftUI

struct VStackPerfomance: View {
    @State var pokemons = pokemonStorage.pokemons
    private let maxWidth = UIScreen.main.bounds.width

    var body: some View {
        VStack(alignment: .leading) {
            Button("Shuffle") {
                self.pokemons.shuffle()
            }
            .padding()

            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(pokemons) { pokemon in
                        PokemonView(pokemon)
                            .frame(maxWidth: self.maxWidth, alignment: .leading)
                    }
                }
                .padding()
            }
        }
        .navigationTitle("VStackPerfomance")
    }
}

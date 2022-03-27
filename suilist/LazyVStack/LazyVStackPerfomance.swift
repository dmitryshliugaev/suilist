import SwiftUI

struct LazyVStackPerfomance: View {
    @State var pokemons = pokemonStorage.pokemons
    
    var body: some View {
        VStack(alignment: .leading) {
            Button("Shuffle") {
                self.pokemons.shuffle()
            }
            .padding()
            
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(pokemons) { pokemon in
                        PokemonView(pokemon)
                    }
                }
                .padding()
            }
        }
        .navigationTitle("LazyVStackPerfomance")
    }
}

// wwdc20-10031: "List contents are always loaded lazily".

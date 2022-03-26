import SwiftUI

struct VStackState: View {
    @State var pokemons = pokemonStorage.pokemons[0...100]
    
    var body: some View {
        VStack(alignment: .leading) {
            Button("Shuffle") {
                self.pokemons.shuffle()
            }
            .padding()
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(pokemons) { pokemon in
                        ScrollView(.horizontal, showsIndicators: true) {
                            HStack {
                                ForEach(pokemons[0...4]) { pokemon in
                                    PokemonView(pokemon)
                                }
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("VStackState")
    }
}

// Use VStack, when u need custom animation isnside a "List" or if u need save UI state

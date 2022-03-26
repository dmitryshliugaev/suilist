import SwiftUI

struct LazyVStackReusable: View {
    @State var pokemons = pokemonStorage.pokemons
    @State var listId = UUID()
    
    var body: some View {
        VStack(alignment: .leading) {
            Button("Shuffle") {
                self.pokemons.shuffle()
            }
            .padding()
            
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(pokemons) { pokemon in
                        ScrollView(.horizontal, showsIndicators: true) {
                            HStack {
                                ForEach(pokemons[0...10]) { pokemon in
                                    PokemonView(pokemon)
                                }
                            }
                            .id(pokemon.id)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("LazyVStackReusable")
    }
}

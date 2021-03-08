import SwiftUI

struct ListWithScroll: View {
    @State var pokemons = pokemonStorage.pokemons
    @State var lastApearPokemon = 0

    var body: some View {
        ScrollViewReader { scrollProxy in
            VStack {
                Button("Scroll to") {
                    scrollProxy.scrollTo(50, anchor: .top)
                }
                .padding()

                Button("Scroll to last appear") {
                    scrollProxy.scrollTo(lastApearPokemon, anchor: .center)
                }
                .padding()

                List(pokemons) { pokemon in
                    PokemonView(pokemon)
                        .onAppear {
                            lastApearPokemon = pokemon.id
                            debugPrint("\(pokemon.title)")
                        }
                }
            }
        }
        .navigationTitle("ListWithScroll")
    }
}

// scrollTo work only with item
// scroll content offset only from GeometryReader

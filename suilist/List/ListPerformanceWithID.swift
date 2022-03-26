import SwiftUI

struct ListPerformanceWithID: View {
    @State var pokemons = pokemonStorage.pokemons
    
    var body: some View {
        VStack(alignment: .leading) {
            Button("Shuffle") {
                self.pokemons.shuffle()
            }
            .padding()
            
            List(pokemons) { pokemon in
                PokemonView(pokemon)
            }
            .listStyle(.plain)
            .id(UUID())
            // When u use ID parameter u just rebuilding list without elements compare
        }
        .navigationTitle("ListPerformanceWithID")
    }
}

import SwiftUI

struct ListPerformance: View {
    @State var pokemons = pokemonStorage.pokemons
    
    var body: some View {
        VStack(alignment: .leading) {
            Button("Shuffle") {
                self.pokemons.shuffle()
                // After called shuffle function each elements in list compared with others
            }
            .padding()
            
            List(pokemons) { pokemon in
                PokemonView(pokemon)
            }
            .listStyle(.plain)
        }
        .navigationTitle("ListPerformance")
    }
}

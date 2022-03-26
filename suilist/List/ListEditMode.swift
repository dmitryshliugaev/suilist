import SwiftUI

struct ListEditMode: View {
    @State var pokemons = pokemonStorage.pokemons
    
    var body: some View {
        VStack(alignment: .leading) {
            List {
                ForEach(pokemons) { pokemon in
                    PokemonView(pokemon)
                }
                .onDelete { pokemons.remove(atOffsets: $0) }
                .onMove { pokemons.move(fromOffsets: $0, toOffset: $1) }
            }
            .listStyle(.plain)
        }
        .toolbar { EditButton() }
        .navigationTitle("ListEditMode")
    }
}

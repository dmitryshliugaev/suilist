import SwiftUI

struct ListPerformance: View {
    @State var pokemons = pokemonStorage.pokemons

//    init() {
//        UITableView.appearance().separatorStyle = .none
//    }

    var body: some View {
        VStack(alignment: .leading) {
            Button("Shuffle") {
                self.pokemons.shuffle()
            }
            .padding()

            List(pokemons) { pokemon in
                PokemonView(pokemon)
            }
            // .id(UUID())
        }
        .navigationTitle("ListPerformance")
    }
}

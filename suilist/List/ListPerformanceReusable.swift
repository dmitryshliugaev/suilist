import SwiftUI

struct ListPerformanceReusable: View {
    @State var pokemons = pokemonStorage.pokemons

    var body: some View {
        List {
//            Button("RemoveFirst") {
//                pokemons.removeFirst()
//            }
//            .padding()

            ForEach(pokemons) { pokemon in
                HStack(alignment: .center) {
                    Image("\(pokemon.id)")
                        .resizable()
                        .frame(width: 100, height: 100)

                    VStack(alignment: .leading) {
                        Text("\(randomString(length: pokemon.id))")
                    }
                }
            }
            .onDelete { indexSet in
                indexSet.forEach { index in
                    pokemons.remove(at: index)
                }
            }

//            ForEach(pokemons) { pokemon in
//                ScrollView(.horizontal, showsIndicators: true) {
//                    HStack {
//                        ForEach(pokemons[0...10]) { pokemon in
//                            PokemonView(pokemon)
//                        }
//                    }
//                }
//                .id(pokemon.id)
//            }
        }
        .navigationTitle("ListPerformanceReusable")
    }
}

// dynamic height
// всегда срабатывает reusable и сохраняет стейт ячейки

// Используем List, когда нужны фичи из UITableView (onDelete)

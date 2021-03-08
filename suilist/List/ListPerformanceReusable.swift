import SwiftUI

struct ListPerformanceReusable: View {
    @State var pokemons = pokemonStorage.pokemons
    @State var listId = UUID()

    var body: some View {
        List {
            Button("RemoveFirst") {
                pokemons.removeFirst()
                // listId = UUID()
            }
            .padding()

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
                    listId = UUID()
                }
            }

//            ForEach(pokemons) { _ in
//                ScrollView(.horizontal, showsIndicators: true) {
//                    HStack {
//                        ForEach(pokemons[0...10]) { pokemon in
//                            PokemonView(pokemon)
//                        }
//                    }
//                }
//            }
        }
        .id(listId)
        .navigationTitle("ListPerformanceReusable")
    }
}

// dynamic height
// reusable

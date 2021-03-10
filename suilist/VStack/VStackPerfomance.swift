import SwiftUI

struct VStackPerfomance: View {
    @State var pokemons = pokemonStorage.pokemons

    var body: some View {
        VStack(alignment: .leading) {
            Button("Shuffle") {
                self.pokemons.shuffle()
            }
            .padding()

            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(pokemons) { pokemon in
                        PokemonView(pokemon)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding()

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
        }
        .navigationTitle("VStackPerfomance")
    }
}

// Используем VStack, когда нужна анимация внутри элементов или сохранение состояния view

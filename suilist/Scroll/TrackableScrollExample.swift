import SwiftUI

struct TrackableScrollExample: View {
    @State private var scrollViewContentOffset = CGFloat(0)
    @State var pokemons = pokemonStorage.pokemons

    var body: some View {
        TrackableScrollView(.vertical, showIndicators: true, contentOffset: $scrollViewContentOffset) {
            LazyVStack(alignment: .leading) {
                Button("Shuffle") {
                    pokemons.shuffle()
                }
                .padding()

                ForEach(pokemons) { pokemon in
                    PokemonView(pokemon)
                }
            }
            .padding()
        }
        .navigationTitle("TrackableScrollExample")
    }
}

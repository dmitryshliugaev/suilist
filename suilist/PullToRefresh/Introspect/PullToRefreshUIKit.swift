import SwiftUI

struct PullToRefreshUIKit: View {
    @State var pokemons = pokemonStorage.pokemons
    @State var isShowing = false

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
        .pullToRefresh(isShowing: $isShowing) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.isShowing = false
                self.pokemons.shuffle()
            }
        }
        .onChange(of: self.isShowing) { _ in }
            
        }
        .navigationBarTitle("PullToRefreshUIKit")
    }
}

import SwiftUI

struct PullToRefreshExample: View {
    @State var pokemons = pokemonStorage.pokemons
    @State var isShowing = false

    var body: some View {
        List(pokemons) { pokemon in
            PokemonView(pokemon)
        }
        .pullToRefresh(isShowing: $isShowing) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.isShowing = false
                self.pokemons.shuffle()
            }
        }
        .onChange(of: self.isShowing) { _ in }
        .navigationBarTitle("PullToRefreshExample")
    }
}

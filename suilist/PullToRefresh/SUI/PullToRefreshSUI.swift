import SwiftUI

struct PullToRefreshSUI: View {
    @ObservedObject var model = RefreshModel()
    @State private var alternate: Bool = true

    var body: some View {
        VStack(spacing: 0) {
            if #available(iOS 15.0, *) {
                List(model.pokemons) { pokemon in
                    PokemonView(pokemon)
                }
                .listStyle(.plain)
                .refreshable {
                    model.pokemons.shuffle()
                }
            } else {
                VStack {
                    Color(UIColor.systemBackground).frame(height: 30)
                }

                PullToRefreshableScrollView(height: 40, refreshing: self.$model.loading) {
                    ForEach(model.pokemons) { pokemon in
                        PokemonView(pokemon)
                            .padding(.leading, 20)
                    }
                }
            }
        }
        .navigationTitle("PullToRefreshSUI")
    }
}



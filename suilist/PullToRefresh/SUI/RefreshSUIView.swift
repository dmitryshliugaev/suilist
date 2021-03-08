import SwiftUI

struct RefreshSUIView: View {
    @ObservedObject var model = RefreshModel()
    @State private var alternate: Bool = true

    var body: some View {
        VStack(spacing: 0) {
            VStack {
                Color(UIColor.systemBackground).frame(height: 30)
            }

            RefreshableScrollView(height: 40, refreshing: self.$model.loading) {
                ForEach(model.pokemons) { pokemon in
                    PokemonView(pokemon)
                }
            }
        }
        .navigationTitle("RefreshSUIView")
    }
}

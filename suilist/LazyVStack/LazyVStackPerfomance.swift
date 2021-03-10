import SwiftUI

struct LazyVStackPerfomance: View {
    @State var pokemons = pokemonStorage.pokemons
    @State var listId = UUID()

    var body: some View {
        VStack(alignment: .leading) {
            Button("Shuffle") {
                self.pokemons.shuffle()
            }
            .padding()

            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(pokemons) { pokemon in
                        PokemonView(pokemon)
                    }

//                ForEach(pokemons) { pokemon in
//                    HStack(alignment: .center) {
//                        Image("\(pokemon.id)")
//                            .resizable()
//                            .frame(width: 100, height: 100)
//
//                        VStack(alignment: .leading) {
//                            Text("\(randomString(length: pokemon.id))")
//                        }
//                    }
//                }

//                ForEach(pokemons) { pokemon in
//                    ScrollView(.horizontal, showsIndicators: true) {
//                        HStack {
//                            ForEach(pokemons[0...10]) { pokemon in
//                                PokemonView(pokemon)
//                            }
//                        }
//                    }
//                    //.id(pokemon.id)
//                }
                }
                .padding()
            }
        }
        .navigationTitle("LazyVStackPerfomance")
    }
}

// List/LazyVStack https://developer.apple.com/forums/thread/651256
// wwdc20-10031: "List contents are always loaded lazily".

// https://www.reddit.com/r/SwiftUI/comments/hf1mya/whats_difference_between_lazyvstack_and_list/fvv7irq?utm_source=share&utm_medium=web2x&context=3
// A list is really just a wrapper for NSTableView/UITableView. It does lazy loading of cells but brings with it a lot of baggage and limitations that stem from the TableView need for delegates, and from the underlying cell-based table view structure.
//
// A VStack is a free-form StackView that contains arbitrary combinations of other views and manages their layout and organization. It does not appear to do any optimization for the presentation of items that are off-screen. (e.g. When some of its content is scrolled off-screen in a ScrollView.)
//
// Without seeing the implementation of the Lazy variant, it looks like they are branching out from the UIKit components and providing the VStack with the ability to dynamically load and present its content only when the content is visible.
//
// It is only natural really since UIKit/AppKit are event-driven APIs that rely extensively on delegation and call backs, while SwiftUI is data driven.

// Использовать LazyVStack, когда хотим самую лучшую производительность для reusable

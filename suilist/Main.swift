import SwiftUI

struct Main: View {
    private var links: [(title: String, view: AnyView)] = [
        ("ListPerformance", ListPerformance().eraseToAnyView()),
        ("ListPerformanceReusable", ListPerformanceReusable().eraseToAnyView()),
        ("LazyVStackPerfomance", LazyVStackPerfomance().eraseToAnyView()),
        ("VStackPerfomance", VStackPerfomance().eraseToAnyView()),
        ("ListWithScroll", ListWithScroll().eraseToAnyView()),
        ("TrackableScrollExample", TrackableScrollExample().eraseToAnyView()),
        ("RefreshSUIView", RefreshSUIView().eraseToAnyView()),
        ("PullToRefresh", PullToRefreshExample().eraseToAnyView()),
    ]

    var body: some View {
        NavigationView {
            List(links, id: \.title) { link in
                NavigationLink(destination: link.view) {
                    Text(link.title)
                }
            }
            .navigationBarTitle("Lists") // , displayMode: .inline)
        }
    }
}

public extension View {
    func eraseToAnyView() -> AnyView {
        return AnyView(self)
    }
}

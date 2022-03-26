import SwiftUI

struct Main: View {
    let links: [ListItem] = [
        ListItem("List", [Screen("ListPerformance", ListPerformance().eraseToAnyView()),
                          Screen("ListPerformanceWithID", ListPerformanceWithID().eraseToAnyView()),
                          Screen("ListEditMode", ListEditMode().eraseToAnyView())]),
        
        ListItem("LazyVStack", [Screen("LazyVStackPerfomance", LazyVStackPerfomance().eraseToAnyView()),
                                Screen("LazyVStackReusable", LazyVStackReusable().eraseToAnyView())]),
        
        ListItem("VStack", [Screen("VStackPerfomance", VStackPerfomance().eraseToAnyView()),
                            Screen("VStackState", VStackState().eraseToAnyView())]),
        
        ListItem("Scroll", [Screen("ListWithScroll", ListWithScroll().eraseToAnyView()),
                            Screen("TrackableScrollExample", TrackableScrollExample().eraseToAnyView())]),
        
        ListItem("PullToRefresh", [Screen("PullToRefreshSUI", PullToRefreshSUI().eraseToAnyView()),
                                   Screen("PullToRefreshUIKit", PullToRefreshUIKit().eraseToAnyView())])
    ]
    
    var body: some View {
        NavigationView {
            List(links, id: \.title) { listItem in
                Section(header: Text(listItem.title)) {
                    ForEach(listItem.screens, id: \.title) { screen in
                        NavigationLink(destination: screen.view) {
                                Text(screen.title)
                            }
                    }
                }
            }
            .listStyle(.inset)
            .navigationBarTitle("SUI Lists 🙈")
        }
    }
}

struct ListItem {
    let title: String
    let screens: [Screen]
    
    init(_ title: String, _ screens: [Screen]) {
        self.title = title
        self.screens = screens
    }
}

struct Screen {
    let title: String
    let view: AnyView
    
    init(_ title: String, _ view: AnyView) {
        self.title = title
        self.view = view
    }
}

public extension View {
    func eraseToAnyView() -> AnyView {
        return AnyView(self)
    }
}


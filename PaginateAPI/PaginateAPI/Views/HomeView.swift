import SwiftUI

struct HomeView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            MarketsView()
                .tag(1)
                .tabItem {
                    Label("Markets", systemImage: "bitcoinsign.circle")
                }
            
            MarketsView()
                .tag(2)
                .tabItem {
                    Label("Explore", systemImage: "magnifyingglass")
                }
            
            MarketsView()
                .tag(3)
                .tabItem {
                    Label("Portfolio", systemImage: "chart.pie")
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

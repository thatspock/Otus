import SwiftUI

struct ContentView: View {
    @State var tabSelection = 0
    
    var body: some View {
        TabView(selection: $tabSelection) {
            DashboardScreen()
                .tag(0)
                .tabItem {
                    Label("Dashboard", systemImage: "house")
                }
            
            ProfileScreen()
                .tag(1)
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

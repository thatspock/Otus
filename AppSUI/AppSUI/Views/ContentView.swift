import SwiftUI

struct ContentView: View {
    @State private var tabSelection = 1
    @State private var isHidden = false
    
    var body: some View {
        TabView(selection: $tabSelection) {
            ProfileScreen(tabSelection: $tabSelection, isHidden: $isHidden)
                .tag(1)
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
           
            DashboardScreen(isHidden: $isHidden)
                .tag(2)
                .tabItem {
                    Label("Market", systemImage: "cart.fill")
                }
            
            ModalScreen()
                .tag(3)
                .tabItem {
                    Label("Message", systemImage: "paperplane.fill")
                }
            
            NewsScreen()
                .tag(4)
                .tabItem {
                    Label("News", systemImage: "newspaper.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

import SwiftUI

struct ProfileScreen: View {
    @Binding var tabSelection: Int
    
    var body: some View {
        ZStack {
            VStack {
                NavigationView {
                    Button {
                        tabSelection = 2
                    } label: {
                        Text("Go To second screen")
                    }
                }
            }
        }
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen(tabSelection: .constant(2))
    }
}

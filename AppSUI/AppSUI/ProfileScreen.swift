import SwiftUI

struct ProfileScreen: View {
    @Binding var tabSelection: Int
    
    
    var body: some View {
        ZStack {
            VStack {
                NavigationView {
                    Text("Go To second screen")
                        .onTapGesture {
                            tabSelection = 2
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

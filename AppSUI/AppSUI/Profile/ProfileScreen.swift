import SwiftUI

struct ProfileScreen: View {
    @Binding var tabSelection: Int
    @Binding var isHidden: Bool
    
    var body: some View {
        ZStack {
            VStack {
                Text("Go To second screen")
                    .onTapGesture {
                        isHidden = true
                        tabSelection = 2
                    }
            }
        }
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen(tabSelection: .constant(2), isHidden: .constant(false))
    }
}

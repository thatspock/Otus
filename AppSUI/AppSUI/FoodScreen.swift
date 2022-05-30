import SwiftUI

struct FoodScreen: View {
    @Environment(\.presentationMode) var presentationMode
    
    var title: String
    
    var body: some View {
        VStack {
            Text(title)
        }
        .navigationBarHidden(true)
        .navigationTitle(title)
        
        Text("back")
            .onTapGesture {
                presentationMode.wrappedValue.dismiss()
            }
    }
}

struct FoodScreen_Previews: PreviewProvider {
    static var previews: some View {
        FoodScreen(title: "Test title")
    }
}

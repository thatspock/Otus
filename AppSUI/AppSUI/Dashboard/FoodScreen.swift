import SwiftUI

struct FoodScreen: View {
    @Environment(\.presentationMode) var presentationMode
//    @StateObject var fruitViewModel = FruitViewModel()
    var title: String
    
    var body: some View {
            VStack {
                Spacer()
                
                Text(title.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .foregroundColor(.indigo)
                
                Spacer()
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Go Back".uppercased())
                        .padding()
                        .font(.caption)
                        .padding(.horizontal, 30)
                        .background(.indigo)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.bottom, 40)
                }
            }
    }
}

struct FoodScreen_Previews: PreviewProvider {
    static var previews: some View {
        FoodScreen(title: "Test")
    }
}

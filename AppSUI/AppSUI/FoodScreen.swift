import SwiftUI

struct FoodScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var fruitViewModel: FruitViewModel = FruitViewModel()
    
    var body: some View {
        ZStack {
            Color.teal.ignoresSafeArea()
            VStack {
                ForEach(fruitViewModel.fruitArray) {
                    Text($0.name)
                }
                
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
                }
            }
        }
    }
}

struct FoodScreen_Previews: PreviewProvider {
    static var previews: some View {
        FoodScreen()
    }
}

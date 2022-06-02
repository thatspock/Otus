import SwiftUI

struct FruitModel: Identifiable {
    let id = UUID().uuidString
    let emoji: String
    let name: String
    let isFav: Bool
}

final class FruitViewModel: ObservableObject {
    @Published private(set) var toggleTitle = "Switch it!"
    
    @Published private(set) var fruitArray = [
        FruitModel(emoji: "🍌", name: "Banana", isFav: true),
        FruitModel(emoji: "🍏", name: "Apple", isFav: false),
        FruitModel(emoji: "🍓", name: "Strawberry", isFav: false),
        FruitModel(emoji: "🍉", name: "Watermelon", isFav: true),
        FruitModel(emoji: "🍊", name: "Orange", isFav: true)
    ]
}

final class DashboardViewModel: ObservableObject {
    @Published var promos = Array(0...20)
}

struct DashboardScreen: View {
    @StateObject var dashboardViewModel = DashboardViewModel()
    @State var showModal = false
    
    var body: some View {
        NavigationView {
            VStack {
                PromosView()
                FoodListView()
                Button {
                    showModal.toggle()
                } label: {
                    Text("Show it!")
                        .padding()
                        .padding(.horizontal, 30)
                        .background(.ultraThinMaterial)
                        .cornerRadius(10)
                        .foregroundColor(.primary)
                }
                .sheet(isPresented: $showModal) {
                    Text("Some View")
                }
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

struct PromosView: View {
    @StateObject var dashboardViewModel = DashboardViewModel()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(dashboardViewModel.promos, id: \.self) {
                    Text("\($0)")
                        .frame(width: 100, height: 100)
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(10)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

struct FoodListView: View {
    @StateObject var fruitViewModel = FruitViewModel()
    @State private var isFavShowed = false
    
    var body: some View {
        VStack {
            List {
                FruitFilterView(isFavShowed: $isFavShowed)
                
                ForEach(fruitViewModel.fruitArray) { fruit in
                    if isFavShowed || fruit.isFav {
                        NavigationLink(destination: FoodScreen(title: fruit.name), label: {
                            Label {
                                Text(fruit.name)
                            } icon: {
                                Text(fruit.emoji)
                            }
                        })
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.inset)
        }
    }
}

struct FruitFilterView: View {
    @Binding var isFavShowed: Bool
    @StateObject var fruitViewModel = FruitViewModel()
    
    var body: some View {
        Toggle(fruitViewModel.toggleTitle, isOn: $isFavShowed)
    }
}

struct DashboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreen()
    }
}

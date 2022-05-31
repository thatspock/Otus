import SwiftUI

struct FruitModel: Identifiable {
    let id = UUID().uuidString
    let name: String
    let isFav: Bool
}

final class FruitViewModel: ObservableObject {
    @Published private(set) var fruitArray = [
        FruitModel(name: "Banana", isFav: true),
        FruitModel(name: "Apple", isFav: false),
        FruitModel(name: "Strawberry", isFav: false),
        FruitModel(name: "Melon", isFav: true)
    ]
    
    
}

final class DashboardViewModel: ObservableObject {
    @Published var promos = Array(0...20)
}

struct DashboardScreen: View {
    @StateObject var dashboardViewModel = DashboardViewModel()
    
    var body: some View {
        VStack {
            PromosView()
            FoodListView()
        }
    }
}

struct FoodListView: View {
    @StateObject var fruitViewModel = FruitViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List(fruitViewModel.fruitArray) { fruit in
                    NavigationLink(destination: FoodScreen(fruitViewModel: fruitViewModel), label: {
                        Text(fruit.name)
                    })
                }
            }
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
                }
            }
        }
    }
}

struct DashboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreen()
    }
}

import SwiftUI

struct Food: Identifiable {
    let name: String
    let isFav: Bool
    
    var id = UUID().uuidString
}

final class FoodListViewModel {
    @Published private(set) var foods = [
        Food(name: "Banana", isFav: true),
        Food(name: "Apple", isFav: false),
        Food(name: "Strawberry", isFav: false),
        Food(name: "Melon", isFav: true)
    ]
}

final class DashboardViewModel: ObservableObject {
    @Published var promos: [Int] = Array<Int>(0...20)
    
    init() {
        
    }
}

struct DashboardScreen: View {
    @EnvironmentObject var dashboardViewModel: DashboardViewModel
    var body: some View {
        VStack {
            PromosView()
            Button {
                // tbc
            } label: {
                Text("Submit!")
            }

        }
    }
}

struct FoodListView: View {
    @StateObject var viewModel: FoodListViewModel = .init()
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.foods) { food in
                    NavigationLink(destination: FoodScreen(title: food.name), label: {
                        Text(food.name)
                    })
                }
            }
        }
    }
}

struct PromosView: View {
    @EnvironmentObject var dashboardViewModel: DashboardViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(dashboardViewModel.promos, id: \.self) { i in
                    Text("\(i)")
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

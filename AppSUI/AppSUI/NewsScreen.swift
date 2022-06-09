import SwiftUI

final class NewsViewModel: ObservableObject {
    @Published var listType = 0
    var listTypes = ["List", "Grid", "Grid iOS 13"]
    
    init() {
        
    }
}

struct NewsScreen: View {
    @StateObject var newsViewModel = NewsViewModel()
    
    var body: some View {
        VStack {
            Picker("Lists", selection: $newsViewModel.listType) {
                ForEach(0..<newsViewModel.listTypes.count) {
                    Text(newsViewModel.listTypes[$0])
                        .tag($0)
                }
            }
            .pickerStyle(.segmented)
            .padding(.top, 30)
            
            
            switch newsViewModel.listType  {
            case 0:
                list
            case 1:
                grid
            case 2:
                gridiOS13
            default:
                EmptyView()
            }
            
            Spacer()
        }
    }
    
    var list: some View {
        List() {
            Text("List")
                .listRowSeparator(.hidden)
        }
        .listStyle(.inset)
    }
    
    var grid: some View {
        List() {
            Text("Grid")
                .listRowSeparator(.hidden)
        }
        .listStyle(.inset)
    }
    
    var gridiOS13: some View {
        List() {
            Text("Grid iOS 13")
                .listRowSeparator(.hidden)
        }
        .listStyle(.inset)
    }
}

struct NewsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewsScreen()
    }
}

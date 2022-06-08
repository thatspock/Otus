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
            .pickerStyle(SegmentedPickerStyle())
            
            
            switch newsViewModel.listType  {
            case 0:
                list
            case 1:
                grid
            case 2:
                gridOS13
            default:
                EmptyView()
            }
        }
    }
    
    var list: some View {
        List() {
            Text("List")
        }
    }
    
    var grid: some View {
        EmptyView()
    }
    
    var gridOS13: some View {
        EmptyView()
    }
}

struct NewsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewsScreen()
    }
}

import SwiftUI
import NewsNetwork

extension Article: Identifiable {
    public var id: String { url }
}

final class NewsViewModel: ObservableObject {
    @Published var listType = 0
    var listTypes = ["List", "Grid", "Grid iOS 13"]
    var lazyGrid: [GridItem] = Array(repeating: .init(), count: 2)
    var gridiOS13: [[Article]] = .init()
    
    @Published var articles: [Article] = .init()
    
    init() {
        ArticlesAPI.everythingGet(q: "ios 16",
                                  from: "2022-06-01",
                                  sortBy: "pubishedAt",
                                  language: "en",
                                  apiKey: "02bc5fb2d8ae4d73973e8fe89b93570f") { list, error in
            debugPrint("👺", error ?? "no error")
            self.articles = list?.articles ?? []
            self.collectArticlesGridIOS13()
        }
    }
    
    func collectArticlesGridIOS13() {
        let columned = articles.publisher.collect(3)
        _ = columned.collect().sink {
            self.gridiOS13 = $0
        }
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
        List(newsViewModel.articles) {
            ArticleCell(title: "\($0.title.asStringOrEmpty)",
                        description: "\($0.description.asStringOrEmpty)")
                .listRowSeparator(.hidden)
        }
        .listStyle(.inset)
    }
    
    var grid: some View {
        ScrollView {
            LazyVGrid(columns: newsViewModel.lazyGrid) {
                ForEach(newsViewModel.articles) {
                    ArticleCell(title: "\($0.title.asStringOrEmpty)",
                                description: "\($0.description.asStringOrEmpty)")
                }
            }
            .padding()
        }
    }
    
    var gridiOS13: some View {
        ScrollView {
            VStack(spacing: 8) {
                ForEach(0..<newsViewModel.gridiOS13.count) { row in
                    HStack(spacing: 8) {
                        ForEach(newsViewModel.gridiOS13[row]) {
                            ArticleCell(title: "\($0.title.asStringOrEmpty)",
                                        description: "\($0.description.asStringOrEmpty)")
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

struct NewsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewsScreen()
    }
}

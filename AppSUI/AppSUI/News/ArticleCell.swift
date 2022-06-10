import SwiftUI

struct ArticleCell: View {
    var title: String
    var description: String
    
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .foregroundColor(.gray.opacity(0.1))
            
            VStack {
                Text(title.isEmpty ? description : title)
                    .foregroundColor(.primary.opacity(0.8))
                    .padding()
                    .font(.title2)
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 200)
    }
}

struct ArticleCell_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCell(title: "SwiftUI’s built-in shapes.", description: "SwiftUI gives us five built-in shapes that are commonly used: rectangle, rounded rectangle, circle, ellipse, and capsule.")
    }
}

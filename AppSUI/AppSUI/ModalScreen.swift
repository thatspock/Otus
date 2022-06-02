import SwiftUI

struct ModalScreen: View {
    @State var showModal = false
    
    var body: some View {
        ZStack {
            VStack {
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
            }
        }
    }
}

struct ModalScreen_Previews: PreviewProvider {
    static var previews: some View {
        ModalScreen()
    }
}

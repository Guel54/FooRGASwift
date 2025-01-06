import SwiftUI

struct HeaderView: View {
    var body: some View {
        Image("header")
            .resizable()
            .aspectRatio(contentMode: .fill) // Füllt den gesamten Bereich
            .frame(width: 400, height: 170)
            .clipped() // Beschneidet das Bild

    }
}

#Preview {
    HeaderView()
}

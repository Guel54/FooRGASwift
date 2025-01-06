import SwiftUI


struct SearchBar: View {
    @Binding var searchText: String
    var onSearchTapped: (() -> Void)?
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 50)
                .foregroundColor(Color("search"))
                .shadow(radius: 1)
                .frame(height: 50)
                .padding(.horizontal)
            HStack {
                TextField("Search", text: $searchText)
                    .foregroundColor(.black)
                    .padding(.leading, 20)
                
                Spacer()
                
                Button {
                    onSearchTapped?()
                } label: {
                    Image(systemName: "magnifyingglass.circle.fill")
                        .font(.system(size: 40))
                        .foregroundColor(Color("dunkelGelb"))
                }
                .padding(.trailing, 15)
                .accessibilityLabel("Start search")
            }
            .padding(.horizontal, 10)
        }
        .frame(maxWidth: .infinity) 
    }
}

#Preview {
    SearchBar(searchText: .constant("")) {
        print("Search bar tapped")
    }
}

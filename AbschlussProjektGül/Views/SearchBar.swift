//
//  SearchBar.swift
//  ProjektWoche2
//
//  Created by Shorena Polyeva on 27.11.24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    var onSearchTapped: (() -> Void)?
    
    var body: some View {
        ZStack {
              RoundedRectangle(cornerRadius: 50)
                .frame(width: 350, height: 50)
                .foregroundColor(Color.purple)
                .shadow(radius: 1)
                .overlay(alignment: .trailing){
                  HStack {
                      TextField("Search", text: $searchText)
                          .foregroundColor(.black)
                          .padding(.horizontal, 30)
                    Spacer()
                    Button{
                        onSearchTapped?()
                    } label: {
                      Image(systemName: "magnifyingglass.circle.fill")
                    }
                    .font(.system(size: 40))
                    .foregroundColor(Color.gray)
                    .padding(.horizontal, 5)
                  }
                }
            }
    }
}

#Preview {
    SearchBar(searchText: .constant("")) {
        print("Search bar tapped")
    }
}

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct AddRecipeView: View {
    @StateObject private var viewModel = AddRecipeViewModel()
    @State private var cookTime: String = ""
    @State private var newIngredient: String = ""
    @State private var ingredients: [String] = []
    @State private var showRecipeList = false

    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemGray6)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Rezept erstellen")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.pink)
                            .padding(.horizontal)

                        VStack(spacing: 15) {
                            TextField("Rezepttitel", text: $viewModel.title)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
                            
                            TextEditor(text: $viewModel.description)
                                .frame(height: 100)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)

                            TextField("Kochzeit (z.B. 1h 30min)", text: $cookTime)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
                        }
                        .padding(.horizontal)

                        VStack(alignment: .leading, spacing: 10) {
                            Text("Zutaten")
                                .font(.headline)
                                .foregroundColor(.gray)
                            
                            HStack {
                                TextField("Neue Zutat hinzufügen", text: $newIngredient)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
                                
                                Button(action: {
                                    if !newIngredient.isEmpty {
                                        ingredients.append(newIngredient)
                                        newIngredient = ""
                                    }
                                }) {
                                    Image(systemName: "plus.circle.fill")
                                        .foregroundColor(.pink)
                                        .font(.title2)
                                }
                            }
                            
                            ForEach(ingredients, id: \.self) { ingredient in
                                HStack {
                                    Text(ingredient)
                                    Spacer()
                                    Button(action: {
                                        ingredients.removeAll { $0 == ingredient }
                                    }) {
                                        Image(systemName: "trash")
                                            .foregroundColor(.red)
                                    }
                                }
                                .padding(8)
                                .background(Color.white)
                                .cornerRadius(8)
                            }
                        }
                        .padding(.horizontal)

                        Button(action: {
                            viewModel.addRecipe()
                            showRecipeList = true
                        }) {
                            Text("Rezept hinzufügen")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.pink)
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                    }
                    .padding(.vertical)
                }
                
                NavigationLink(
                    destination: AddRecipeListView(viewModel: viewModel),
                    isActive: $showRecipeList
                ) { EmptyView() }
            }
            .navigationTitle("Neues Rezept")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}

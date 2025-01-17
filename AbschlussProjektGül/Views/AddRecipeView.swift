import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct AddRecipeView: View {
    @StateObject private var viewModel = AddRecipeViewModel()
    @State private var ingredients: [String] = []
    @State private var cookTime: String = ""
    @State private var newIngredient: String = ""
    @State private var showRecipeList = false

    var body: some View {
        NavigationView {
            ZStack {
                Color(.salbeiGrun)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Rezept erstellen")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.dunkelGrun)
                            .padding(.horizontal)
                        
                        VStack(spacing: 15) {
                            TextField("Rezepttitel", text: $viewModel.title)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.dunkelGrun, lineWidth: 1)
                                )
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
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.dunkelGrun, lineWidth: 1)
                                )
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Zutaten")
                                .font(.headline)
                                .foregroundColor(.dunkelGrun)
                            
                            HStack {
                                TextField("Neue Zutat hinzufügen", text: $newIngredient)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.dunkelGrun, lineWidth: 1)
                                    )
                                Button(action: {
                                    if !newIngredient.isEmpty {
                                        ingredients.append(newIngredient)
                                        newIngredient = ""
                                    }
                                }) {
                                    Image(systemName: "plus.circle.fill")
                                        .foregroundColor(Color("dunkelGelb"))
                                        .font(.title2)
                                        .overlay(
                                            Circle()
                                                .stroke(Color.gray, lineWidth: 2)
                                                
                                        )
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
                                            .foregroundColor(Color("dunkelGrun"))
                                    }
                                }
                                .padding(8)
                                .background(Color.white)
                                .cornerRadius(8)
                            }
                        }
                        .padding(.horizontal)
                        
                        Button(action: {
                            viewModel.addRecipe(
                                title: viewModel.title,
                                description: viewModel.description,
                                cookTime: cookTime,
                                ingredients: ingredients
                            )
                            showRecipeList = true
                        }) {
                            Text("Rezept hinzufügen")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.dunkelGrun, lineWidth: 1)
                                )
                                .background(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            Color("oliveGrun"),
                                            Color("dunkelGrun"),
                                            Color("salbeiGrun")
                                        ]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                    }
                }
                
                // Floating Action Button
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            showRecipeList = true
                        }) {
                            Image(systemName: "fork.knife")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color("dunkelGelb"))
                                .clipShape(Circle())
                                .shadow(color: .gray.opacity(0.4), radius: 4, x: 0, y: 2)
                        }
                        .padding()
                    }
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

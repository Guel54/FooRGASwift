import SwiftUI

struct SettingsView: View {
    @State private var showEditProfile = false
    
    var body: some View {
        NavigationView {
            List {
                // Account Section
                Section(header: Text("Account").foregroundColor(.dunkelGrun)) {
                    NavigationLink(destination: EditProfileView()) {
                        Label("Edit Profile", systemImage: "person.circle")
                    }
                    Label("Security", systemImage: "shield")
                    Label("Notifications", systemImage: "bell")
                    Label("Privacy", systemImage: "lock")
                }
                .listRowBackground(Color("salbeiGrun").opacity(0.2))
                
                // Support & About Section
                Section(header: Text("Support & About").foregroundColor(.dunkelGrun)) {
                    Label("My Subscription", systemImage: "creditcard")
                    Label("Help & Support", systemImage: "questionmark.circle")
                    Label("Terms and Policies", systemImage: "info.circle")
                }
                .listRowBackground(Color("salbeiGrun").opacity(0.2))
                
                // Cache & Cellular Section
                Section(header: Text("Cache & Cellular").foregroundColor(.dunkelGrun)) {
                    Label("Free up Space", systemImage: "trash")
                    Label("Data Saver", systemImage: "arrow.2.squarepath")
                }
                .listRowBackground(Color("salbeiGrun").opacity(0.2))
                
                // Actions Section
                Section(header: Text("Actions").foregroundColor(.dunkelGrun)) {
                    Label("Report a Problem", systemImage: "exclamationmark.bubble")
                    Label("Add Account", systemImage: "person.badge.plus")
                    Label("Log Out", systemImage: "arrowshape.turn.up.left")
                }
                .listRowBackground(Color("salbeiGrun").opacity(0.2))
            }
            .scrollContentBackground(.hidden) // Verhindert, dass der Hintergrund der Liste standardmäßig weiß ist
            .background(Color("salbeiGrun").ignoresSafeArea())
            .navigationTitle("Settings")
            .foregroundStyle(.dunkelGelb)
        }
    }
}

struct EditProfileView: View {
    @AppStorage("username") private var username: String = "Guest"
    @AppStorage("userEmail") private var userEmail: String = "guest@example.com"

    @State private var password: String = "********"
    @State private var dateOfBirth = Date()
    @State private var selectedCountry = "Nigeria"
    @State private var profileImage: UIImage?
    @State private var showImagePicker = false

    let countries = ["Türkei", "Germany", "USA", "France", "India"]

    var body: some View {
        Form {
            // Profilbild
            Section {
                HStack {
                    Spacer()
                    VStack {
                        if let profileImage = profileImage {
                            Image(uiImage: profileImage)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                                .overlay(
                                    Image(systemName: "camera")
                                        .padding(6)
                                        .background(Color.white)
                                        .clipShape(Circle())
                                        .offset(x: 35, y: 35)
                                )
                        } else {
                            Image(systemName: "person.circle")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.gray)
                                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                                .overlay(
                                    Image(systemName: "camera")
                                        .padding(6)
                                        .background(Color.white)
                                        .clipShape(Circle())
                                        .offset(x: 35, y: 35)
                                )
                        }
                        Text("Change Photo")
                            .foregroundColor(.dunkelGelb)
                            .font(.caption)
                            .onTapGesture {
                                showImagePicker = true
                            }
                    }
                    Spacer()
                }
            }
            
            // Persönliche Informationen
            Section(header: Text("Personal Information").foregroundStyle(.black)) {
                TextField("Name", text: $username)
                    .foregroundStyle(.black)
                TextField("Email", text: $userEmail)
                    .keyboardType(.emailAddress)
                    .foregroundStyle(.black)
                SecureField("Password", text: $password)
                    .foregroundStyle(.black)
                DatePicker("Date of Birth", selection: $dateOfBirth, displayedComponents: .date)
                Picker("Country/Region", selection: $selectedCountry) {
                    ForEach(countries, id: \.self) { country in
                        Text(country)
                    }
                }
            }
            .listRowBackground(Color("salbeiGrun").opacity(0.2))
            
            // Änderungen speichern
            Section {
                Button(action: {
                    // Änderungen sind automatisch durch @AppStorage gespeichert
                    print("Changes saved!")
                }) {
                    Text("Save Changes")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color.dunkelGrun, Color.oliveGrun, Color.salbeiGrun]), startPoint: .leading, endPoint: .trailing)
                        )
                        .foregroundStyle(.dunkelGrun)
                        .cornerRadius(8)
                        .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                }
            }
            .listRowBackground(Color("salbeiGrun").opacity(0.2))
        }
        .scrollContentBackground(.hidden) // Verhindert, dass der Hintergrund des Formulars standardmäßig weiß ist
        .background(Color("salbeiGrun").ignoresSafeArea())
        .navigationTitle("Edit Profile")
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(selectedImage: $profileImage)
        }
    }
}

#Preview {
    SettingsView()
}

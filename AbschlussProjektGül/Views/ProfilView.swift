import SwiftUI
import PhotosUI

struct ProfileView: View {
    @AppStorage("username") private var username: String = "Guest"
    @AppStorage("userEmail") private var userEmail: String = "guest@example.com"
    @State private var profileImage: UIImage? = nil
    @State private var showSettings = false
    @State private var showImagePicker = false
    @State private var selectedItem: PhotosPickerItem? = nil

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Header mit Benutzerinformationen
                VStack(spacing: 10) {
                    if let profileImage = profileImage {
                        Image(uiImage: profileImage)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                    } else {
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.gray)
                            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                    }
                    
                    Text(username) // Benutzername aus AppStorage
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text(userEmail) // E-Mail aus AppStorage
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.7))
                }
                .padding(.top, 40)
                
                // Button zum Ändern des Profilbilds
                PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
                    Text("Change Photo")
                        .foregroundColor(.dunkelGelb)
                        .font(.caption)
                }
                .onChange(of: selectedItem) { newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self),
                           let image = UIImage(data: data) {
                            profileImage = image
                        }
                    }
                }

                Divider()
                    .background(Color.white.opacity(0.5))
                    .padding(.horizontal, 40)
                
                // Optionen
                VStack(spacing: 15) {
                    NavigationLink(destination: Text("My Subscription")) {
                        ProfileOptionRow(icon: "creditcard", text: "My Subscription")
                    }
                    NavigationLink(destination: Text("Security")) {
                        ProfileOptionRow(icon: "shield", text: "Security")
                    }
                    NavigationLink(destination: Text("Help & Support")) {
                        ProfileOptionRow(icon: "questionmark.circle", text: "Help & Support")
                    }
                    NavigationLink(destination: Text("About")) {
                        ProfileOptionRow(icon: "info.circle", text: "About")
                    }
                }
                .padding(.top, 20)

                Spacer()

                // Button für die Einstellungen
                Button(action: {
                    showSettings = true
                }) {
                    HStack {
                        Image(systemName: "gearshape.fill")
                            .foregroundColor(.white)
                        Text("Settings")
                            .foregroundColor(.white)
                            .fontWeight(.medium)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.dunkelGelb)
                    .cornerRadius(8)
                    .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                }
                .padding(.horizontal, 40)
                .background(
                    NavigationLink(destination: SettingsView(), isActive: $showSettings) {
                        EmptyView()
                    }
                )

                Spacer()
            }
            .padding()
            .background(Color("Salbeigrün").ignoresSafeArea())
            .navigationTitle("Profile")
        }
    }

    struct ProfileOptionRow: View {
        var icon: String
        var text: String

        var body: some View {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.dunkelGelb)
                Text(text)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.white.opacity(0.5))
            }
            .padding()
            .background(Color.white.opacity(0.1))
            .cornerRadius(8)
            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
        }
    }
}
#Preview {
    ProfileView()
}

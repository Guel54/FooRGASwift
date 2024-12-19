//
//  SettingsView.swift
//  ProjektWoche2
//
//  Created by Gül Köse on 28.11.24.
//
import SwiftUI

struct SettingsView: View {
    // Benutzer- und Benachrichtigungseinstellungen
    @AppStorage("username") private var username: String = "Guest"
    @AppStorage("userEmail") private var userEmail: String = ""
    @AppStorage("birthDate") private var birthDate: Date = Date()

    @AppStorage("notificationsEnabled") private var notificationsEnabled: Bool = false
    @AppStorage("notificationTypes") private var notificationTypes: String = "All"
    
    // Dark Mode und Spracheinstellungen
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("appLanguage") private var appLanguage = "Deutsch"
    
    // Lokale Variablen
    @State private var notificationEnabled = true
    @State private var showNotificationOptions = false
    @State private var showPrivacyPolicy = false  // Neue Variable für das Sheet
    
    // Unterstützte Sprachen
    let languages = ["Deutsch", "Englisch", "Französisch", "Spanisch"]
    
    var body: some View {
        NavigationView {
            Form {
                // Profil Einstellungen
                Section(header: Text("Profile")) {
                    TextField("Username", text: $username)
                    TextField("Email", text: $userEmail)
                        .keyboardType(.emailAddress)
                    DatePicker("Birth Date", selection: $birthDate, displayedComponents: .date)
                }
                
                // Benachrichtigungen
                Section(header: Text("Benachrichtigungen")) {
                    Toggle("Enable Notifications", isOn: $notificationsEnabled)
                    
                    Button(action: {
                        showNotificationOptions = true
                    }) {
                        Text("Notification Types")
                    }
                    .alert(isPresented: $showNotificationOptions) {
                        Alert(
                            title: Text("Choose Notification Types"),
                            message: Text("Select which types of notifications you want to receive."),
                            primaryButton: .default(Text("All")) {
                                notificationTypes = "All"
                            },
                            secondaryButton: .default(Text("Only Important")) {
                                notificationTypes = "Important Only"
                            }
                        )
                    }
                }
                
                // Allgemeine Einstellungen
                Section(header: Text("Allgemein")) {
                    Toggle("Dunkelmodus aktivieren", isOn: $isDarkMode)
                        .onChange(of: isDarkMode) { _ in
                            updateTheme()
                        }
                    
                    Picker("Sprache", selection: $appLanguage) {
                        ForEach(languages, id: \.self) { language in
                            Text(language)
                        }
                    }
                }
                
                // Über die App
                Section(header: Text("Über die App")) {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.0.0").foregroundColor(.gray)
                    }
                    Button("Datenschutzrichtlinien") {
                        showPrivacyPolicy = true  // Sheet anzeigen, wenn der Button geklickt wird
                    }
                    .sheet(isPresented: $showPrivacyPolicy) {
                        PrivacyPolicyView()  // Das neue View für die Datenschutzrichtlinien
                    }
                }
            }
            .navigationTitle("Einstellungen")
        }
    }
    
    // Funktion, um das Theme zu aktualisieren
    private func updateTheme() {
        let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        scene?.windows.first?.overrideUserInterfaceStyle = isDarkMode ? .dark : .light
    }
    
    // Funktion, um Benachrichtigungen zu aktivieren oder zu deaktivieren
    private func updateNotifications(enabled: Bool) {
        // Hier könnte die Logik für das Aktivieren/Deaktivieren von Benachrichtigungen hinzugefügt werden
        print("Benachrichtigungen sind jetzt \(enabled ? "aktiviert" : "deaktiviert")")
    }
}

struct PrivacyPolicyView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Datenschutzrichtlinien")
                    .font(.title)
                    .padding()
                
                ScrollView {
                    Text("Dummy-Text für die Datenschutzrichtlinien. Diese Richtlinien erklären, wie wir mit deinen persönlichen Daten umgehen. Deine Daten werden sicher und vertraulich behandelt, und du kannst jederzeit deine Zustimmung widerrufen.")
                        .padding()
                        .foregroundColor(.gray)
                        .font(.body)
                }
                .padding()
                
                Spacer()
            }
            .navigationTitle("Datenschutzrichtlinien")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

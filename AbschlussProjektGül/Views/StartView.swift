import SwiftUI

struct StartView: View {
   var body: some View {
       ZStack {
           // Hintergrundbild
           Image("Backround")
               .resizable()
               .scaledToFill()
               .edgesIgnoringSafeArea(.all)
           
           // Inhalte im Vordergrund
           VStack {
               // Titel der App
               Text("Welcome")
                   .font(.largeTitle)
                   .fontWeight(.bold)
                   .foregroundColor(.white)
                   .shadow(radius: 5)
                   .padding(.top, 50)
               
               Text("")
                   .font(.largeTitle)
                   .foregroundColor(.white)
                   .shadow(radius: 5)
                   .padding(.top, 50)
               
               Spacer()
               
               // Login-Button
               Button(action: {
                   print("Login Button gedrückt")
               }) {
                   Text("Login")
                       .font(.headline)
                       .foregroundColor(.white)
                       .frame(width: 300, height: 50)
                       .background(
                        LinearGradient(gradient: Gradient(colors: [Color.dunkelGrün, Color.olivegrün, Color.salbeigrün]), startPoint: .leading, endPoint: .trailing)
                       )
                       .cornerRadius(15)
                       .shadow(radius: 5)
               }
               .padding(.bottom, 50) // Platzierung unten
           }
       }
   }
}

#Preview {
   StartView()
}

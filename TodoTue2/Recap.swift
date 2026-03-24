import SwiftUI

struct Dog: Pet, Identifiable {
    var id: UUID = UUID()
    
    var name: String
    var breed: String
    var age: Int
    
    var isMicrochipped: Bool
}

protocol Pet {
    var isMicrochipped: Bool { get set }
}

struct ClinicView: View {
    var dogs: [Dog] = [
        Dog(name: "JImmy", breed: "Poodle", age: 2, isMicrochipped: false),
        Dog(name: "JImmy", breed: "Poodle", age: 2, isMicrochipped: false),
        Dog(name: "JImmy", breed: "Poodle", age: 2, isMicrochipped: false),
        Dog(name: "JImmy", breed: "Poodle", age: 2, isMicrochipped: false),
        Dog(name: "JImmy", breed: "Poodle", age: 2, isMicrochipped: false),
    ]
    
    var body: some View {
        ForEach(dogs) { dog in
            Text(dog.name)
        }
    }
   
}

struct ClinicApp: App {
    var body: some Scene {
        WindowGroup {
            ClinicView()
        }
    }
}

#Preview {
    ClinicView()
}

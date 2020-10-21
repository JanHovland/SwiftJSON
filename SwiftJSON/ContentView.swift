import SwiftUI

/// Sjekke json: https://jsonformatter.curiousconcept.com/#

// MARK: - WelcomeDetailElement
struct PersonElement: Codable, Identifiable {
    let id: Int
    let personData: PersonData
}

// MARK: - PersonData
struct PersonData:Codable {
    let address: String
    let city: String
    let firstName: String
    let lastName: String
    let name: String
}


struct ContentView: View {
    
    @State var result : [PersonElement] = []
    
    var body: some View{
        List(result) {a in
            Text(a.personData.firstName + " " + a.personData.lastName)
        }
        .onAppear(perform: parseJson)
    }
    
    func parseJson() {
        
        if let url = Bundle.main.url(forResource: "Data.json", withExtension: nil){
            
            if let data = try? Data(contentsOf: url){
                
                let jsondecoder = JSONDecoder()
                
                do{
                    let result = try jsondecoder.decode([PersonElement].self, from: data)
                    self.result = result
                    
                }
                catch {
                    print("error trying parse json")
                }
            }
        }
    }
}

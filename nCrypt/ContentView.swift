//
//  ContentView.swift
//  nCrypt
//
//  Created by Ionut Grosu on 04/06/2023.
//

import SwiftUI

struct ContentView: View {
    
    let service: CypherService = CypherService()
    
    @State var inputText: String = ""
    @State var outputText: String = ""
    @State var encryptionKey: Int = 1
    
    var body: some View {
        
        NavigationView{
            VStack {
                Spacer()
                Text(outputText)
                Spacer()
                
                Stepper(value: $encryptionKey,
                        in: 1...50,
                               step: 1) {
                           Text("Encryption key: \(encryptionKey)")
                        .font(.callout)
                       }
                
                HStack{
                    TextField("Input", text: $inputText)
                        .padding()
                        .background(Color.gray.opacity(0.3).cornerRadius(10))
                        .font(.headline)
                    
                    Button(action: {
                        
                    }, label: {
                        
                        Image(systemName: "arrow.forward.circle")
                            .font(.largeTitle)
                        
                    })
                }
            }
            .padding()
            .navigationTitle("nCrypt")
        }
    }
    
    func encrypt() {
        outputText = service.getCaesarCipherOutput(input: inputText.uppercased(), key: encryptionKey)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

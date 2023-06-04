//
//  CypherService.swift
//  nCrypt
//
//  Created by Ionut Grosu on 04/06/2023.
//

import Foundation

struct CypherService {
    
    func getCaesarCipherOutput(input: String, key: Int) -> String {
        
        var output: String = ""

        for unicode in input.unicodeScalars{
            var value = unicode.value
            if value >= 65 && value <= 90 {
                value = value + UInt32(key)
                
                if value > 90 {
                    value = 65 + (value % 91)
                }
                
            }
            output.append(Character(UnicodeScalar(value)!))
        }

        return output
    }
}

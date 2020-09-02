//
//  API.swift
//  iGlossary
//
//  Created by A Khairini on 01/09/20.
//  Copyright © 2020 Infinite Learning ADA. All rights reserved.

/*
 This is for for loading our data (and images too).
 */
//

import Foundation
import SwiftUI

let termList: [Term] = load("termList.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

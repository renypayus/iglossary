//
//  Term.swift
//  iGlossary
//
//  Created by A Khairini on 01/09/20.
//  Copyright © 2020 Infinite Learning ADA. All rights reserved.

/*
 This is the model for each term.
 Term structure will store all the data that we need to build this App
 */
//

import Foundation
import SwiftUI

struct Term: Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var definition: String
    var link: String
    var linktitle: String
}

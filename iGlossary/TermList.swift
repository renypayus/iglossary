//
//  TermList.swift
//  iGlossary
//
//  Created by A Khairini on 01/09/20.
//  Copyright © 2020 Infinite Learning ADA. All rights reserved.
//

import SwiftUI

struct TermList: View {
    
    var body: some View {
        NavigationView {
            VStack {
                List(termList) { term in
                    NavigationLink(destination: TermDefinition(term: term)) {
                      Text(term.name)
                    }
                }
            }
            .navigationBarTitle("Programming Glossary", displayMode: .inline)
        }
    }
}



struct TermList_Previews: PreviewProvider {
    static var previews: some View {
        TermList()
    }
}

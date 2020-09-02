//
//  TermDefinition.swift
//  iGlossary
//
//  Created by A Khairini on 02/09/20.
//  Copyright © 2020 Infinite Learning ADA. All rights reserved.
//

import Foundation
import SwiftUI

struct TermDefinition: View {
    var term: Term
    var body: some View {
        NavigationView {
            VStack {
                
                Text(term.definition)
                    .padding()
                Divider()
                    .padding()
                Text("Learn more about \(term.name):")
                Text(term.linktitle)
                .foregroundColor(.blue)
                    .onTapGesture {
                        let url = URL.init(string: "\(self.term.link)")
                    guard let hyperLink = url, UIApplication.shared.canOpenURL(hyperLink) else { return }
                    UIApplication.shared.open(hyperLink)
                }
                
                Spacer()
                
            }
            .navigationBarTitle(Text(term.name), displayMode: .inline)
        }
    }
}

struct TermDefinition_Previews: PreviewProvider {
    static var previews: some View {
        TermDefinition(term: termList[0])
    }
}



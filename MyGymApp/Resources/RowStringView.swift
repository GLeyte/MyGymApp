//
//  RowStringView.swift
//  MyGymApp
//
//  Created by Gabriel Leite on 21/01/25.
//

import Foundation
import SwiftUI
import UIKit

struct RowStringView: View {
    @Binding var editing: Bool
    var textInfo: String
    @Binding var text: String
    
    var body: some View {
        HStack{
            if !editing {
                Text(textInfo)
                Spacer()
                Text(text)
            } else {
                Text(textInfo)
                TextField(textInfo, text: $text)
                    .multilineTextAlignment(.trailing)
                    .foregroundStyle(Color(.systemGray))
            }
        }
    }
}

#Preview {
    RowStringView(editing: .constant(true), textInfo: "Repetições", text: .constant("10-10-8"))
        .padding()
}

//
//  PrimaryTextField.swift
//  YOSDA-SignUp
//
//  Created by Giovanne Bressam on 09/05/24.
//

import SwiftUI

struct PrimaryTextField: View {
    @State var fieldTitle: String
    @State var inputText: String
    @State var buttonTitle: String? = nil
    @State var isSecured: Bool = false
    @State var hasSecurityToggle: Bool = false
    var buttonAction: (() -> Void)? = nil
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: SpacingConstants.small.constant) {
            HStack {
                Text(fieldTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
                if let buttonTitle,
                   let buttonAction {
                    Spacer()
                    Button(action: buttonAction, label: {
                        Text(buttonTitle)
                    })
                }
            }
            
            HStack {
                inputField
                    .padding(.leading, SpacingConstants.small.constant)
                    .frame(height: 42)
                Spacer()
                if hasSecurityToggle {
                    Button(action: {
                        isSecured.toggle()
                    }, label: {
                        if isSecured {
                            Image(systemName: "eye")
                                .foregroundStyle(.gray)
                        } else {
                            Image(systemName: "eye.slash")
                                .foregroundStyle(.gray)
                        }
                    }).padding(.trailing, SpacingConstants.small.constant)
                }
            }
            .overlay {
                RoundedRectangle(cornerRadius: RadiusConstants.small.constant)
                    .stroke(.highlight, lineWidth: 2.5)
            }
        }
    }
    
    @ViewBuilder
    private var inputField: some View {
        if isSecured {
            SecureField("", text: $inputText)
                .foregroundStyle(.gray)
        } else {
            TextField("", text: $inputText)
                .foregroundStyle(.gray)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    PrimaryTextField(fieldTitle: "Field title", inputText: "")
        .padding(24)
}

#Preview(traits: .sizeThatFitsLayout) {
    PrimaryTextField(fieldTitle: "Field title", inputText: "",
                     isSecured: true,
                     hasSecurityToggle: true)
        .padding(24)
}
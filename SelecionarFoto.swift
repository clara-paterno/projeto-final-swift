//
//  SelecionarFoto.swift
//  projeto_final
//
//  Created by Turma02-19 on 17/11/25.
//

import SwiftUI

struct SelecionarFoto: View {
    
    @Binding var selectedImage: Image?
    @Environment(\.dismiss) var dismiss
    @State var backgroundColor: Color = .fundo
    @State var panelColor: Color = Color("tabColor")
    @State var fotos: [String] = [
        "planta 1",
        "planta 2",
        "planta 3",
        "planta 4",
        "planta 5",
        "planta 6",
        "planta 7",
        "planta 8",
        "planta 9"
    ]
    
    var body: some View {
        
        ZStack{
            
            backgroundColor
                .ignoresSafeArea()
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(panelColor, lineWidth: 4)
                        .ignoresSafeArea()
                        .padding(5)
                )
            
            
            let columns = [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ]
            
            VStack {
                
                LazyVGrid(columns: columns, spacing: 16) {
                    
                    ForEach(fotos, id: \.self){ photo in
                        Button(action: {
                            selectedImage = Image(photo)
                            dismiss()
                            
                        }) {
                            Image(photo)
                                .resizable()
                                .frame(width: 115, height: 115)
                            
                            
                        }
                        
                        
                    }
                    
                    
                }.padding()
                
            }
        }
    }
}


#Preview {
    SelecionarFoto(selectedImage: .constant(Image("leaf.circle")))
}



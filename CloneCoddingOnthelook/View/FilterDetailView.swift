//
//  HeightChooseView.swift
//  CloneCoddingOnthelook
//
//  Created by 성대규 on 1/5/24.
//

import SwiftUI

struct FilterDetailView: View {
    @Binding var low: Double
    @Binding var up: Double
    @Binding var toggleMale: Bool
    @Binding var toggleFemale: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("GENDER")
                    .font(.title)
                    .fontWeight(.ultraLight)
                    .padding(.bottom, 10)
                
                Spacer()
                
                Button("초기화") {
                    low = 145.0
                    up = 195.0
                    toggleMale = false
                    toggleFemale = false
                }
                .tint(Color(.darkmodeSafeBlack))
            }
            HStack {
                Text("MEN")
                    .fontWeight(.bold)
                
                Spacer()
                
                Button(action: {
                    toggleMale.toggle()
                }, label: {
                    if toggleMale { Image(systemName: "checkmark")
                            .foregroundStyle(.darkmodeSafeBlack)
                    } else {
                        Rectangle()
                            .foregroundStyle(.white)
                    }
                })
                .frame(width: 30, height: 30)
                .border(.darkmodeSafeBlack)
                .padding(.trailing, 10)
                
                Text("WOMEN")
                    .fontWeight(.bold)
                
                Spacer()
                
                Button(action: {
                    toggleFemale.toggle()
                }, label: {
                    if toggleFemale { Image(systemName: "checkmark")
                            .foregroundStyle(.darkmodeSafeBlack)
                    } else {
                        Rectangle()
                            .foregroundStyle(.white)
                    }
                })
                .frame(width: 30, height: 30)
                .border(.black)
            }
            .padding(.bottom, 10)
            
            Text("HEIGHT")
                .font(.title)
                .fontWeight(.ultraLight)
                .padding(.bottom, 10)
            
            Text("\(Int(low))cm ~ \(Int(up))cm")
                .fontWeight(.bold)
                .padding(.bottom, 10)
            
            Slider(value: $low, in: 145...170, step: 1)
                .padding()
            
            Slider(value: $up, in: 171...195, step: 1)
                .padding()

            
            Spacer()
            
            // You can use these values (minValue and maxValue) in your filtering logic.
        }
        .padding()
        .navigationTitle("키 선택")
    }
}

#Preview {
    FilterDetailView(low: .constant(140), up: .constant(195), toggleMale: .constant(true), toggleFemale: .constant(false))
}

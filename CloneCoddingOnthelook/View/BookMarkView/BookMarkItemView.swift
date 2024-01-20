//
//  BookMarkItemView.swift
//  CloneCoddingOnthelook
//
//  Created by 성대규 on 1/20/24.
//

import SwiftUI

struct BookMarkItemView: View {
    @EnvironmentObject private var dataModel: TestDataModel
    
    var body: some View {
        let VM = BookMarkItemViewModel(dataModel: dataModel)
        let VMData = VM.DO()
        
        ForEach(VMData.sorted(by: { d1, d2 in
            d1.key.name < d2.key.name
        }), id: \.key) { (profile, cloths) in
            if !cloths.isEmpty {
                HStack {
                    Image(profile.image)
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .clipShape(Circle())
                        .frame(width: 50, height: 50)
                    
                    Text(profile.name)
                    
                    Spacer()
                }
                .padding(.top)
                .padding(.leading)
            }
            
            ForEach(cloths) { cloth in
                BookMarkItemDetailView(clothId: cloth.id)
                Divider()
            }
            .environmentObject(dataModel)
        }
    }
}

#Preview {
    BookMarkItemView()
        .environmentObject(TestDataModel())
}

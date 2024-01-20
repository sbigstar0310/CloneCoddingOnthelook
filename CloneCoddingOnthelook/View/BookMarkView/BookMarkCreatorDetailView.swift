//
//  BookMarkCreatorDetailView.swift
//  CloneCoddingOnthelook
//
//  Created by 성대규 on 1/15/24.
//

import SwiftUI

struct BookMarkCreatorDetailView: View {
    var profile: Profile
    
    var body: some View {
        VStack(spacing: 0) {
            Image(profile.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
            Spacer()
            HStack {
                Text(profile.name)
                    .fontWeight(.bold)
                    .padding(.trailing, 0)
                    .lineLimit(1)
                Image(systemName: "checkmark.seal.fill")
                    .foregroundStyle(.red)
                    .padding(.leading, 0)
            }
            
            Text("\(profile.height)cm•\(profile.weight)kg")
                .fontWeight(.ultraLight)
            
        }
    }
}

#Preview {
    BookMarkCreatorDetailView(profile: testProfiles[0])
}

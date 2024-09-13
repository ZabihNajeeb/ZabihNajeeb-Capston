//
//  SettingRowView.swift
//  SignUp and LogIn
//
//  Created by MacUser on 2024-07-27.
//

import SwiftUI

struct SettingRowView: View {
    let imageName: String
    let title: String
    let tintColor: Color
    
    var body: some View {
        HStack(spacing: 12 ){
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundColor(tintColor)
            
            Text(title)
                .font(.subheadline)
                .foregroundStyle(.black)
            
           }
        }
    }


struct SettingRowView_Preview: PreviewProvider {
    static var previews: some View{
        SettingRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
    }
}

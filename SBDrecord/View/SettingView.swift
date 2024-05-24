//
//  SettingView.swift
//  SBDrecord
//
//  Created by 石崎汐音 on 2024/04/27.
//

import SwiftUI

struct SettingView: View {
    
    @AppStorage("PRweight") var PRweight = 300
    
    
    var body: some View {
        ZStack{
            
            Color.gray.opacity(0.1)
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                Text("\(PRweight) kg")
                    .font(.largeTitle)
                
                Spacer()
                
                Picker(selection: $PRweight){
                    Text("300")
                        .tag(300)
                    Text("350")
                        .tag(350)
                    Text("400")
                        .tag(400)
                    Text("450")
                        .tag(450)
                    Text("500")
                        .tag(500)
                    Text("550")
                        .tag(550)
                    Text("600")
                        .tag(600)
                    Text("650")
                        .tag(650)
                }label: {
                    Text("選択")
                }
                .pickerStyle(.wheel)
                
                Spacer()
            }
        }
    }
}

#Preview {
    SettingView()
}

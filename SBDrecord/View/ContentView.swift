//
//  ContentView.swift
//  SBDrecord
//
//  Created by 石崎汐音 on 2024/04/23.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("squat") var squat = "0"
    @AppStorage("benchPress") var benchPress = "0"
    @AppStorage("deadLift") var deadLift = "0"
    @AppStorage("totalScore") var totalScore = "0"
    @State var roundedGoalScore : Double = 0
    @AppStorage ("PRweight") var PRweight : Double =  300
    @FocusState private var isActive: Bool
    @State var roundedTotalScore : Int = 0
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image(.backgroundTimer)
                    .backgroundModifier()
                VStack {
                    Text("あなたの自己記録")
                        .frame(maxWidth: .infinity)
                        .frame(height: 80)
                        .background(.green)
                        .font(.largeTitle)
                        .bold()
                        .cornerRadius(20)
                        .toolbar{
                            ToolbarItem (placement: .topBarTrailing){
                                NavigationLink{
                                    SettingView()
                                }label: {
                                    Text("目標設定")
                                }
                            }
                        }
                    HStack{
                        Text("スクワット")
                            .padding()
                            .font(.title2)
                        TextField("スクワットの自己記録", text: $squat)
                            .keyboardType(.numberPad)
                            .font(.title2)
                            .focused($isActive)
                    }
                    .padding(.leading, 57.0)
                    .multilineTextAlignment(.center)
                    
                    HStack{
                        Spacer()
                        Text("ベンチ")
                            .padding()
                            .font(.title2)
                        TextField("ベンチの自己記録", text: $benchPress)
                            .keyboardType(.numberPad)
                            .font(.title2)
                            .focused($isActive)
                    }
                    .padding(.leading, 63.0)
                    .multilineTextAlignment(.center)
                    
                    HStack{
                        Spacer()
                        Text("デッド")
                            .padding()
                            .font(.title2)
                        TextField("デッドリフトの自己記録", text: $deadLift)
                            .keyboardType(.numberPad)
                            .font(.title2)
                            .focused($isActive)
                    }
                    .padding(.leading, 57.0)
                    .multilineTextAlignment(.center)
                    .toolbar {  // VStackに指定
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()         // 右寄せにする
                            Button("閉じる") {
                                isActive = false  //  フォーカスを外す
                            }
                        }
                    }
                    
                    Text("トータルスコア")
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(.red)
                    let squatMax = Double(squat) ?? 0
                    let benchPressMax = Double(benchPress) ?? 0
                    let deadLiftMax = Double(deadLift) ?? 0
                    let totalScore = squatMax + benchPressMax + deadLiftMax
                    let roundedTotalScore = Int((totalScore * 100).rounded() / 100)
                    Text("\(roundedTotalScore)")
                        .font(.largeTitle)
                        .padding()
                    
                    Text("あなたの目標達成率")
                        .padding()
                        .foregroundColor(.red)
                        .font(.title)
                    let roundedGoalScore = Int( Double(roundedTotalScore) / PRweight * 100 )
                    let roundedGoalScore2 = String(roundedGoalScore)
                    Text("\(roundedGoalScore2)%")
                        .font(.largeTitle)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

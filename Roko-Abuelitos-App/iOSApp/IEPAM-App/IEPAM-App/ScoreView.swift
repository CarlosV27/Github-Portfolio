//
//  ScoreView.swift
//  IEPAM-App
//
//  Created by Sergio on 19/10/22.
//

import SwiftUI

struct ScoreView: View {
    var score: Double
    
    var body: some View {
        ZStack {
//            Circle()
//                .fill(Color.black)
//                .frame(width: 120, height: 120)
//            Circle()
//                .stroke(lineWidth: 10.0)
//                .opacity(0.55)
//                .foregroundColor(Color.black)
//                .frame(width: 130, height: 130)
            withAnimation {
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(score / 5, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 30.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(.green)
                    .rotationEffect(Angle(degrees: 270.0))
                    .frame(width: 130, height: 130)
            }
            Text(String(format: "%.0f %%", min(score*20, 100.0)))
                .font(.system(size:30))
                .foregroundColor(.black)
                .bold()
        }
        .onAppear{
            print(score)
            print(score/5)
            print(CGFloat(min(score / 5, 1.0)))
            
        }
    }
    
    func ScoreColor(score: Double) -> Color {
        if score < 60 {
            return Color.red
        } else {
            if score >= 60 && score < 85 {
                return Color.yellow
            } else {
                return Color.green
            }
        }
    }

    
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(score: 2)
    }
}

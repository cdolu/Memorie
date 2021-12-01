//
//  ContentView.swift
//  Memorie
//
//  Created by Ceren DOLU on 26.10.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var emojis = ["🚲","🚂","🚁","🚜","🚕","🏎","🚑","🚓","🚒","✈️","🚀","⛵️","🛸","🛶"]
    
    @State var vehicles = ["🚲","🚂","🚁","🚜","🚕","🏎","🚑","🚓","🚒","✈️","🚀","⛵️","🛸","🛶"]
   
    @State var buildings =
        ["🏠","🏭","🏢","🏣","🏤","🏥","🏦","🏨","🏪","🏫","🏛","⛪️","🕌","🕍"]
   
    @State var tech =
        ["⌚️","📱","💻","🖥","🖨","💽","💾","📼","📸","📹","📽","📞","☎️","📟"]
   
    @State var emojiCount = 14
    

    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum:65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                    CardView(content: emoji)
                        .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
        .foregroundColor(.red)
        Spacer()
        HStack {
            veh
            Spacer()
            bul
            Spacer()
            tec
                }
            
        .font(.largeTitle)
        .padding(.horizontal)
        }
        .padding(.horizontal)
        
    }
    
    var veh: some View {
        Button {
            emojiCount = vehicles.count
            emojis = vehicles
            vehicles.shuffle()
        } label: {
            VStack{
                Image(systemName: "car")
                Text("Vehicles").font(.body)
            }
        }
    }
    
    var bul: some View {
        Button {
            emojiCount = buildings.count
            emojis = buildings
            buildings.shuffle()
        } label: {
            VStack{
                Image(systemName: "building.2.crop.circle.fill")
                Text("Buildings").font(.body)
            }
        }
    }
    
    var tec: some View {
        Button {
            emojiCount = tech.count
            emojis = tech
            tech.shuffle()
        } label: {
            VStack{
                Image(systemName: "phone")
                Text("Electronics").font(.body)
            }
        }
    }
    
   
    
struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
                }
            }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}












struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
        }
    }
}

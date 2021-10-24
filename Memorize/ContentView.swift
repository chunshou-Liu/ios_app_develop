//
//  ContentView.swift
//  Memorize
//
//  Created by chunshou on 2021/10/23.
//

import SwiftUI

// define a structure name is ContentView and act as/ like a View
struct ContentView: View {
    var emojis = ["👻", "🎃", "🦇", "🧡", "🕷", "🕸", "💚", ]
    @State var emojiCount = 4
    
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack{
                remove
                Spacer()
                add
            }
            .padding(.horizontal)
            .font(.largeTitle)
        
        }
        .padding(.horizontal)
        
    }
    
    var remove: some View{
        Button(action: {
            if emojiCount > 1{
                emojiCount -= 1
            }
        }, label: {
            Image(systemName: "minus.circle")
        })
    }
    
    var add: some View{
        Button {
            if emojiCount < emojis.count{
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3) //stroke vs. strokeBorder
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
            
        }
        .onTapGesture{
            isFaceUp = !isFaceUp
        }
    }
}






















// it's a glue to glue contentview ui
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {

        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
//        ContentView()
//            .preferredColorScheme(.light)

    }
}

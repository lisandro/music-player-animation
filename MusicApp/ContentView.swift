//
//  ContentView.swift
//  MusicApp
//
//  Created by Lisandro on 26/07/2020.
//

import SwiftUI

struct MusicPlayerBar: View {
    let namespace: Namespace.ID
    var body: some View {
        HStack {
            Image("cover")
                .resizable()
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .padding()
                .matchedGeometryEffect(id: "animation", in: namespace)
            
            Text("Baby Blue")
                .font(.headline)
            
            Spacer()
            
            Image(systemName: "play.fill")
            Image(systemName: "forward.fill")
                .padding(.trailing, 10)
        }
        .frame(maxWidth: .infinity, maxHeight: 60)
        .background(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
    }
}

struct MusicPlayer: View {
    let namespace: Namespace.ID
    var body: some View {
        VStack {
            Image("cover")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .padding(40)
                .matchedGeometryEffect(id: "animation", in: namespace)
            
            HStack {
                
                VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    Text("Baby Blue")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    Text("Badfinger")
                        .font(.title)
                        .fontWeight(.light)
                        .opacity(0.5)
                        .foregroundColor(Color.white)
                    
                    
                })
                .padding()
                Spacer()
            }
            
            HStack {
                Image(systemName: "backward.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                Image(systemName: "play.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 50))
                    .padding([.leading, .trailing], 75)
                Image(systemName: "forward.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 30))
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)))
    }
}

struct ContentView: View {
    @Namespace private var ns
    @State private var showFullScreenPlayer: Bool = false
    var body: some View {
        VStack {
            Spacer()
            if showFullScreenPlayer {
                MusicPlayer(namespace: ns)
            } else {
                MusicPlayerBar(namespace: ns) // Sticky player
            }
        }
        .onTapGesture {
            withAnimation(.spring()) {
                showFullScreenPlayer.toggle()
            }
            
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

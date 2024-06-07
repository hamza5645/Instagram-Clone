//
//  RefreshControlView.swift
//  Instagram
//
//  Created by Hamza Osama on 6/7/24.
//

import SwiftUI

struct RefreshControlView: View {
    let coordinateSpaceName: String
    let onRefresh: () -> Void
    
    @State private var refresh = false
    
    var body: some View {
        GeometryReader { geo in
            if (geo.frame(in: .named(coordinateSpaceName)).midY > 50) {
                Spacer()
                    .onAppear {
                        if !refresh {
                            refresh = true
                            onRefresh()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                refresh = false
                            }
                        }
                    }
            }
            if refresh {
                HStack {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
            } else {
                EmptyView()
            }
        }
        .padding(.top, -50)
    }
}

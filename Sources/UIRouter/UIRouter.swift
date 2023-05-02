//
//  NCGRNavigationLink.swift
//  SwiftuiTemplateiOS
//
//  Created by Reenad gh on 29/08/1444 AH.
//

import SwiftUI

public enum RouterPresentationStyle {
    case push
    case present(isPresented : Binding<Bool>?)
    case sheet(isPresented : Binding<Bool>?)
    case bottomSheet(isPresented : Binding<Bool>?)
}

 public struct UIRouter<Label:View, Destination:View>: View {
    
    let presentationStyle : RouterPresentationStyle
    let destination : Destination
    let label : Label
    var navigationbarHidden : Bool = false
    @Environment(\.presentationMode) var presentationMode
  
     public init(presentationStyle: RouterPresentationStyle , navigationbarHidden : Bool = false , destination: Destination, @ViewBuilder label: () -> Label ){
     
        self.destination = destination
        self.label = label()
        self.presentationStyle = presentationStyle
        self.navigationbarHidden = navigationbarHidden
        
    }
    
     public var body: some View {
        
        switch presentationStyle {
        case .push:
            NavigationLink {
                    destination
                    .navigationBarHidden(navigationbarHidden)
            } label: {
                label
            }
            
        case .present(let isPresented):
            Button {
                isPresented?.wrappedValue.toggle()
            } label: {
                label
            }
            .fullScreenCover(isPresented: isPresented ?? .constant(false)) {
                destination
            }
            
        case .sheet(let isPresented):
            Button {
                
                isPresented?.wrappedValue.toggle()
                
            } label: {
                label
            }
            .sheet(isPresented: isPresented ?? .constant(false)) {
                
                destination
            }
            
        case .bottomSheet(isPresented: let isPresented):
            
            if #available(iOS 16.0, *) {
                Button {
                    isPresented?.wrappedValue.toggle()
                } label: {
                    label
                }
                .sheet(isPresented: isPresented ?? .constant(false)) {
                    destination
                        .presentationDetents([.medium, .large])
                }
            }else {
                    
                    Button {
                        isPresented?.wrappedValue.toggle()
                    } label: {
                        label
                    }
                    .fullScreenCover(isPresented: isPresented ?? .constant(true)) {
                        destination
                    }
                }
            }
        }
    }


import SwiftUI

@available(iOS 16.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct ExplorersApp<T: View>: View {
    
    public var contents: T
    
    private let width = 1080.0
    private let height = 810.0
    
    public init(@ViewBuilder content: () -> T){
        self.contents = content()
    }
    
    public var body: some View {
        GeometryReader { reader in
            Rectangle()
                .fill(.black)
            
            let scale = min(reader.size.width / width, reader.size.height / height)
            
            contents
                .frame(width: width, height: height)
                .background(Color.white.shadow(color: .black.opacity(0.3), radius: 8))
                .scaleEffect(scale)
                .frame(width: reader.size.width, height: reader.size.height)
                .onAppear {
                    print(reader.size.width, reader.size.height)
                }
                .preferredColorScheme(.light)
        }
        .edgesIgnoringSafeArea(.all)
        .persistentSystemOverlays(.hidden)
        .statusBarHidden()
    }
}

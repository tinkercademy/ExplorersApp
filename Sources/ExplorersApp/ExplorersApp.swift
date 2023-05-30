import SwiftUI

@available(iOS 16.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct ExplorersApp<T: View>: View {
    
    public var contents: T
    
    public var orientation: Orientation = .landscape
    
    private let width = 1080.0
    private let height = 810.0
    
    public init(_ orientation: Orientation = .landscape, @ViewBuilder content: () -> T){
        self.contents = content()
        self.orientation = orientation
    }
    
    public var body: some View {
        GeometryReader { reader in
            Rectangle()
                .fill(.black)
            
            let finalWidth = orientation == .landscape ? width : height
            let finalHeight = orientation == .landscape ? height : width
            
            let scale = min(reader.size.width / finalWidth, reader.size.height / finalHeight)
            
            contents
                .frame(width: finalWidth, height: finalHeight)
                .background(Color.white.shadow(color: .black.opacity(0.3), radius: 8))
                .scaleEffect(scale)
                .frame(width: reader.size.width, height: reader.size.height)
                .preferredColorScheme(.light)
        }
        .edgesIgnoringSafeArea(.all)
        .persistentSystemOverlays(.hidden)
        .statusBarHidden()
    }
}

public enum Orientation {
    case portrait
    case landscape
}

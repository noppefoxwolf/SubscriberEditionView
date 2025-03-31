import SwiftUI


public struct SubscriberEditionView<Content: View>: View {
    let title: String
    let subtitle: String
    @ViewBuilder
    let content: () -> Content
    
    public init(
        title: String,
        subtitle: String,
        content: @escaping () -> Content
    ) {
        self.title = title
        self.subtitle = subtitle
        self.content = content
    }
    
    public var body: some View {
        ZStack {
            CircularTextView(
                title: title,
                angle: .degrees(200)
            )
            CircularTextView(
                title: subtitle,
                angle: .degrees(160),
                reversed: true
            )
        }
        .font(.system(size: 12, weight: .black))
        .overlay {
            content()
        }
    }
}

#Preview {
    SubscriberEditionView(
        title: "サブスクリプション",
        subtitle: "+ICLOUD+",
        content: {
            Image(systemName: "icloud.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 36, height: 36)
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            Color.blue.opacity(0.5),
                            Color.blue,
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
        }
    )
    .frame(width: 82, height: 82)
    .padding()
}


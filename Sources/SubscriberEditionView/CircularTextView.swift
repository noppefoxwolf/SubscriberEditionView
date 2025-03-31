import SwiftUI

struct CircularTextView: View {
    @State var title: String
    var angle: Angle = .degrees(180)
    var offsetAngle: Angle = .degrees(0)
    var reversed: Bool = false
    
    init(
        title: String,
        angle: Angle = .degrees(180),
        offsetAngle: Angle = .degrees(0),
        reversed: Bool = false
    ) {
        self.title = title
        self.angle = angle
        self.offsetAngle = offsetAngle
        self.reversed = reversed
    }
    
    var lettersOffset: [(offset: Int, element: Character)] {
        if reversed {
            Array(title.reversed().enumerated())
        } else {
            Array(title.enumerated())
        }
    }
    
    var body: some View {
        ZStack {
            Color.clear
            
            ForEach(lettersOffset, id: \.offset) {
                index,
                letter in
                Text(String(letter))
                    .frame(
                        maxHeight: .infinity,
                        alignment: reversed ? .bottom : .top
                    )
                    .rotationEffect(fetchAngle(at: index))
            }
            .rotationEffect(offsetAngle)
        }
    }
    
    func fetchAngle(at index: Int) -> Angle {
        let count = title.count
        guard count > 0 else { return .zero }
        
        let anglePerLetter = angle.radians / Double(count)
        let offsetFromCenter = Double(index) - Double(count - 1) / 2.0
        let angleForIndex = anglePerLetter * offsetFromCenter
        
        return .radians(angleForIndex)
    }
}

import SwiftUI

enum Direction: String, CaseIterable {
    case north
    case south
    case east
    case west
}

struct EnumPickerExampleView: View {
    @State var direction = Direction.north

    var body: some View {
        Picker("Direction", selection: $direction) {
            ForEach(Direction.allCases, id: \.self) { direction in
                Text(direction.rawValue)
                    .tag(direction)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct EnumPickerExampleView_Previews: PreviewProvider {
    static var previews: some View {
        EnumPickerExampleView()
    }
}

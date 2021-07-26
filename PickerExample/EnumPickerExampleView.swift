import SwiftUI

enum CardSuit: String, CaseIterable {
    case diamonds, clubs, hearts, spades

    var symbol: String {
        switch self {
        case .diamonds:
            return "♦️"
        case .clubs:
            return "♣️"
        case .hearts:
            return "♥️"
        case .spades:
            return "♠️"
        }
    }

    var title: String {
        "\(symbol) \(rawValue.capitalized)"
    }
}

struct EnumPickerExampleView: View {
    @State var suit: CardSuit = .diamonds

    var body: some View {
        VStack(spacing: 30) {
            VStack {
                Text("Picker with SegmentedPickerStyle")

                Picker("Suit", selection: $suit) {
                    ForEach(CardSuit.allCases, id: \.self) { suit in
                        Text(suit.title)
                            .tag(suit)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }

            Divider()

            VStack {
                Text("Picker with MenuPickerStyle")

                Picker(suit.title, selection: $suit) {
                    ForEach(CardSuit.allCases, id: \.self) { suit in
                        Text(suit.title)
                            .tag(suit)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
            Divider()

            VStack {
                Text("Menu")

                Menu(
                    content: {
                        ForEach(CardSuit.allCases, id: \.self) { suit in
                            Button(suit.title) {
                                self.suit = suit
                            }
                        }
                    },
                    label: {
                        Text(self.suit.title)
                    }
                )
            }

            Divider()

            Text("Context Menu (long press to select)")

            VStack {
                Text(self.suit.title)
                    .contextMenu {
                        ForEach(CardSuit.allCases, id: \.self) { suit in
                            Button(suit.title) {
                                self.suit = suit
                            }
                        }
                    }
            }
        }
        .padding()
    }
}

struct EnumPickerExampleView_Previews: PreviewProvider {
    static var previews: some View {
        EnumPickerExampleView()
    }
}

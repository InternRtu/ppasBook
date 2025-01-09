import SwiftUI

struct CustomBottomBar: View {
    @Binding var selectedTab: Tab

    enum Tab: String, CaseIterable {
        case Services = "rosette"
        case Home = "house"
        case Booking = "cursorarrow.click"
    }

    var body: some View {
        ZStack {
            // Background with rounded corners and shadow
            RoundedRectangle(cornerRadius: 30, style: .continuous)
            .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 15, x: 0, y: -5)
                .frame(height: 110)
                .frame(width:413)

            HStack {
                ForEach(Tab.allCases, id: \.self) { tab in
                    Spacer()
                    VStack(spacing: 5) {
                        Image(systemName: tab.rawValue)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(selectedTab == tab ? Color.blue : Color.gray)

                        Text(tabTitle(tab))
                            .font(.caption)
                            .foregroundColor(selectedTab == tab ? Color.blue : Color.gray)
                    }
                    .onTapGesture {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                            selectedTab = tab
                        }
                    }
                    Spacer()
                }
            }
            .padding(.bottom,20)
    
            .padding(.vertical, 10)
        }
        .frame(height: 70)
        .padding(.horizontal, 15) // Adds spacing to the left and right edges
        .edgesIgnoringSafeArea(.bottom) // Ensures smooth integration with screen edge
    }

    private func tabTitle(_ tab: Tab) -> String {
        switch tab {
        case .Services: return "Services"
        case .Home: return "Home"
        case .Booking: return "Booking"
        }
    }
}


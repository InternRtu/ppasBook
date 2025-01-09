import SwiftUI



struct ContentView: View {

    @State private var selectedTab: CustomBottomBar.Tab = .Home
    @State private var isSliderOpen: Bool = false 
    var body: some View {
        ZStack {
            // Minimalist background
            MinimalistBackgroundWithShapes()
                .edgesIgnoringSafeArea(.all)

            // Main content
            VStack(spacing: 0) {
                HeaderView(isSliderOpen: $isSliderOpen) // Pass binding to HeaderView

                NavigationView {
                    VStack(spacing: 0) {
                        switch selectedTab {
                        case .Home:
                            HomePage()
                        case .Services:
                            Text("Services Page")
                        case .Booking:
                            Text("Booking Page")
                        }
                    }
                    .background(Color.clear)
                }
                .background(Color.clear)

                // Custom Bottom Bar
                CustomBottomBar(selectedTab: $selectedTab)
                    .edgesIgnoringSafeArea(.bottom)
            }
            .edgesIgnoringSafeArea(.bottom)

            // Slider Menu
            SliderMenu(isOpen: $isSliderOpen)
        }
    }
}


struct SliderMenu: View {
    @Binding var isOpen: Bool

    var body: some View {
        ZStack(alignment: .leading) {
            // Dimmed overlay when menu is open
            if isOpen {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            isOpen = false // Close menu when tapping outside
                        }
                    }
            }

            // Slider menu content
            HStack {
                VStack(alignment: .leading, spacing: 30) {
                    // Logo Section
                    HStack(alignment:.center) {
                        Image("logo1") // SF Symbol for logo
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)
                            .padding(.leading,50)
                            
                    }
                    .padding(.bottom, 16)
                    // Profile Section
                    HStack {
                        Image(systemName: "person.crop.circle.fill") // SF Symbol for profile picture
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.blue)

                        VStack(alignment: .leading, spacing: 4) {
                            Text("Al-Amin Farha")
                                .font(.headline)
                                .foregroundColor(.primary)
                            Text("aminworldwide@gmail.com")
                                .font(.caption)
                                .foregroundColor(.gray)
                            Button(action: {
                                print("View Profile tapped")
                            }) {
                                Text("View Profile")
                                    .font(.caption)
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding(.leading, 8)
                    }
                    .padding(.bottom,20)
                    // Menu Items
                    VStack(alignment: .leading, spacing: 20) {
                        MenuItem(icon: "square.grid.2x2.fill", title: "Dashboard")
                        MenuItem(icon: "newspaper.fill", title: "News")
                        MenuItem(icon: "gearshape.fill", title: "Settings")
                        MenuItem(icon: "book.circle.fill", title: "Visit OPAC")
                        MenuItem(icon: "phone.fill", title: "Contact Us")
                        MenuItem(icon: "mappin.circle.fill", title: "All Location")
                    }

                    Spacer()

                   
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .frame(width: 300)
                .background(Color.white)
                .offset(x: isOpen ? 0 : -350) // Slide animation
                .animation(.easeInOut, value: isOpen)
                .padding(.leading,20)
                Spacer()
            }
        }
    }
}

// MARK: - Menu Item Component
struct MenuItem: View {
    let icon: String
    let title: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(Color.gray)
            Text(title)
                .font(.headline)
                .foregroundColor(Color.primary)
        }
        .padding(.vertical, 4)
    }
}

         

#Preview {
    ContentView()
}

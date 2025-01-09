import SwiftUI


// MARK: - HomePage
struct HomePage: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                NewsSection()
                    .padding(.horizontal)

                Divider()
                    .background(Color.gray.opacity(0.5))
                    .padding(.horizontal)

                UpcomingEventsSection()
                    .padding(.horizontal)
            }
            .padding(.top, 16)
            .padding(.bottom, 16)
        }
    }
}

// MARK: - Minimalist Background with Shapes
struct MinimalistBackgroundWithShapes: View {
    var body: some View {
        ZStack {
            Color.gray.opacity(0.1)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Spacer()
                    Circle()
                        .frame(width: 200, height: 200)
                        .foregroundColor(Color(red: 12 / 255, green: 178 / 255, blue: 176 / 255, opacity: 0.3))
                        .offset(x: 100, y: -70)
                    Circle()
                        .frame(width: 150, height: 150)
                        .foregroundColor(Color(red: 12 / 255, green: 178 / 255, blue: 176 / 255))
                        .offset(x: 30, y: -30)
                }
                Spacer()
                HStack(spacing: 0) {
                    Circle()
                        .frame(width: 150, height: 150)
                        .foregroundColor(Color(red: 12 / 255, green: 178 / 255, blue: 176 / 255))
                        .offset(x: -30, y: 30)
                    Circle()
                        .frame(width: 200, height: 200)
                        .foregroundColor(Color(red: 12 / 255, green: 178 / 255, blue: 176 / 255, opacity: 0.3))
                        .offset(x: -70, y: 70)
                    Spacer()
                }
            }
        }
    }
}

// MARK: - Header View
struct HeaderView: View {
    @Binding var isSliderOpen: Bool 
    var body: some View {
        ZStack {
            Color.cyan
            
            .edgesIgnoringSafeArea(.all)

            HStack {
                Button(action: {
                    withAnimation{
                        isSliderOpen.toggle()
                    }
                }) {
                    Image(systemName: "line.horizontal.3")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(8)
                        .background(
                            Circle()
                                .fill(Color.white.opacity(0.2))
                        )
                }

                Spacer()

                VStack(spacing: 2) {
                    Text("Shah Alam")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    Text("Clear • 29°C")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                }

                Spacer()

                Button(action: {}) {
                    Image(systemName: "bell.fill")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(8)
                        .background(
                            Circle()
                                .fill(Color.white.opacity(0.2))
                        )
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 12)
        }
        .frame(height: 80)
            }
}

// MARK: - News Section
struct NewsSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Latest News Weng")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .padding(.leading,20)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(0..<5) { index in
                        VStack {
                            Image(systemName: "newspaper.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .foregroundColor(.blue)

                            Text("News Item \(index + 1)")
                                .font(.subheadline)
                                .multilineTextAlignment(.center)
                                .lineLimit(2)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .frame(width: 250, height: 160)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.white)
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                        )
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
            }
        }
    }
}

// MARK: - Upcoming Events Section
struct UpcomingEventsSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Upcoming Events")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .padding(.leading,20)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(0..<3) { index in
                        VStack(alignment: .leading, spacing: 8) {
                            Image("event-placeholder")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 220, height: 170)
                                .clipped()
                                .cornerRadius(12)

                            VStack(alignment: .leading, spacing: 4) {
                                Text("Event Title")
                                    .font(.headline)

                                HStack {
                                    Label("Date", systemImage: "calendar")
                                        .font(.caption)
                                    Label("Pax", systemImage: "person.2.fill")
                                        .font(.caption)
                                    Label("Place", systemImage: "mappin.and.ellipse")
                                        .font(.caption)
                                }
                                .foregroundColor(.secondary)

                                Button(action: {}) {
                                    Text("View Detail")
                                        .fontWeight(.bold)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(
                                            RoundedRectangle(cornerRadius: 8)
                                                .fill(LinearGradient(
                                                    gradient: Gradient(colors: [Color.green, Color.teal]),
                                                    startPoint: .top,
                                                    endPoint: .bottom
                                                ))
                                        )
                                        .foregroundColor(.white)
                                }
                            }
                            .padding(12)
                            .padding(.leading,10)
                        }
                        .frame(width: 200)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.white)
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                        )
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
            }
        }
    }
}





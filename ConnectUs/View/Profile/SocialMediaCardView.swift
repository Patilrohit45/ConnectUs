import SwiftUI
import Lottie

class SocialMediaListManager: ObservableObject {
    @Published var socialMediaList: [SocialMedia] = []
}

struct SocialMedia: Identifiable {
    let id = UUID()
    let platform: String
    var link: String? = nil
}

struct CardsView: View {
    let platform: String

    var body: some View {
        VStack {
            LottieView(name: animationFileName(for: platform), loopMode: .loop)
                .scaleEffect(0.2)
                .padding()
        }
        .padding()
        .frame(width: 100, height: 100)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.2), radius: 8, x: 7, y: 4)
    }

    private func animationFileName(for platform: String) -> String {
        switch platform {
        case "Instagram":
            return "InstagramAnimation"
        case "Twitter":
            return "TwitterAnimation"
        case "LinkedIn":
            return "LinkedinAnimation"
        default:
            return "" // Return an appropriate default Lottie animation filename if needed
        }
    }
}

struct SocialMediaCardView: View {
    @State private var showSocialMediaList = false
    @State private var selectedSocialMedia: String?
    @State private var linkTextFieldText = ""

    @EnvironmentObject var socialMediaListManager: SocialMediaListManager

    var body: some View {
        VStack {
            Text("Social Accounts")
                .font(.system(size: 30))
                .foregroundColor(.white)
                .offset(x: -80)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(socialMediaListManager.socialMediaList) { socialMedia in
                        CardsView(platform: socialMedia.platform)
                            .onTapGesture {
                                if let link = socialMedia.link, let url = URL(string: link) {
                                    UIApplication.shared.open(url)
                                }
                            }
                    }

                    Button(action: {
                        showSocialMediaList.toggle()
                    }) {
                        Text("+")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 60, height: 60)
                            .background(Color.blue)
                            .clipShape(Circle())
                            .padding(.leading, socialMediaListManager.socialMediaList.isEmpty ? 20 : 0)
                            .padding(.trailing, socialMediaListManager.socialMediaList.isEmpty ? 0 : 20)
                    }
                    .sheet(isPresented: $showSocialMediaList) {
                        SocialMediaListView(
                            selectedSocialMedia: $selectedSocialMedia,
                            socialMediaListManager: socialMediaListManager,
                            linkTextFieldText: $linkTextFieldText, // Pass the binding here
                            onAdd: { platform in
                                socialMediaListManager.socialMediaList.append(SocialMedia(platform: platform, link: linkTextFieldText))
                                showSocialMediaList = false // Dismiss the sheet
                                selectedSocialMedia = nil // Reset selected platform
                                linkTextFieldText = "" // Clear the textfield text
                            }
                        )
                    }
                }
                .padding(.horizontal)
            }

            Spacer()
        }
        .padding()
        .navigationBarTitle("Card View Example", displayMode: .inline)
    }
}

struct SocialMediaListView: View {
    let socialMediaOptions = ["Instagram", "Twitter", "LinkedIn"] // Add more social media platforms if needed
    @Binding var selectedSocialMedia: String?
    @ObservedObject var socialMediaListManager: SocialMediaListManager
    @Binding var linkTextFieldText: String // Add this binding

    var onAdd: ((String) -> Void)? // Closure to be called after adding the link and platform

    var body: some View {
        NavigationView {
            List(socialMediaOptions, id: \.self) { platform in
                VStack(alignment: .leading, spacing: 8) {
                    Button(action: {
                        selectedSocialMedia = platform
                    }) {
                        Text(platform)
                    }

                    if selectedSocialMedia == platform {
                        HStack {
                            TextField("Enter link", text: $linkTextFieldText)
                                .textFieldStyle(RoundedBorderTextFieldStyle())

                            Button(action: {
                                if let index = socialMediaListManager.socialMediaList.firstIndex(where: { $0.platform == platform }) {
                                    socialMediaListManager.socialMediaList[index].link = linkTextFieldText
                                }
                                onAdd?(platform) // Call the closure after adding the link and platform
                            }) {
                                Text("Add")
                                    .foregroundColor(.white)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 20)
                                    .background(Color.blue)
                                    .cornerRadius(8)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationBarTitle("Select Social Media")
        }
    }
}


struct SocialMediaCardView_Previews: PreviewProvider {
    static var previews: some View {
        SocialMediaCardView()
            .environmentObject(SocialMediaListManager())
    }
}

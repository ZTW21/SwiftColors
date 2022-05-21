//
//  ContentView.swift
//  Swift Colors
//
//  Created by Zack Wilson on 4/20/21.
//

/// TODO
/// • Save and load color palettes to local storage
///     º Login screen? Save palettes to the cloud?
/// • Add social network
/// • Add loading screen



import SwiftUI
import ColorThiefSwift
import NotificationBannerSwift
import MobileCoreServices
import GoogleMobileAds

struct ContentView: View {
    @State private var isShowPhotoLibrary = false
    @State private var isShowCamera = false
    @State private var image = UIImage()
    @State var activeSheet: ActiveSheet?
    
    @State var cOne: UIColor = UIColor.white
    @State var cTwo: UIColor = UIColor.white
    @State var cThree: UIColor = UIColor.white
    @State var cFour: UIColor = UIColor.white
    @State var cFive: UIColor = UIColor.white
    @State var cSix: UIColor = UIColor.white
    @State var cSeven: UIColor = UIColor.white
    @State var cEight: UIColor = UIColor.white
    @State var cNine: UIColor = UIColor.white
    
    @State var c1Hex: String = "#FFFFFF"
    @State var c2Hex: String = "#FFFFFF"
    @State var c3Hex: String = "#FFFFFF"
    @State var c4Hex: String = "#FFFFFF"
    @State var c5Hex: String = "#FFFFFF"
    @State var c6Hex: String = "#FFFFFF"
    @State var c7Hex: String = "#FFFFFF"
    @State var c8Hex: String = "#FFFFFF"
    @State var c9Hex: String = "#FFFFFF"
    
    @State private var selection = 2;
    
    
    var body: some View {
        TabView(selection: $selection) {
            ZStack{
                AnimatedBackgroundView().edgesIgnoringSafeArea(.all)
                    .blur(radius: 50)
                    .scaleEffect(1.5)
                Text("TODO: Add friends/social network")
            }
            .tabItem{
                Image(systemName: "person.3.fill")
            }
            .tag(1)
            ZStack {
                AnimatedBackgroundView().edgesIgnoringSafeArea(.all)
                    .blur(radius: 50)
                    .scaleEffect(1.5)
                VStack {
                    Spacer()
                    HStack {
                        Button(action: {
                            self.isShowPhotoLibrary = true
                            activeSheet = .library
                            
                        }, label: {
                            PickImageButton()
                        })
                        
                        
                        
                        
                        Button(action: {
                            self.isShowCamera = true
                            activeSheet = .camera
                            
                        }, label: {
                            TakeImageButton()
                        })
                    }
                    
                    Button(action: {
                        generatePalette(self.image,
                                        cOne: &cOne,
                                        cTwo: &cTwo,
                                        cThree: &cThree,
                                        cFour: &cFour,
                                        cFive: &cFive,
                                        cSix: &cSix,
                                        cSeven: &cSeven,
                                        cEight: &cEight,
                                        cNine: &cNine,
                                        c1Hex: &c1Hex,
                                        c2Hex: &c2Hex,
                                        c3Hex: &c3Hex,
                                        c4Hex: &c4Hex,
                                        c5Hex: &c5Hex,
                                        c6Hex: &c6Hex,
                                        c7Hex: &c7Hex,
                                        c8Hex: &c8Hex,
                                        c9Hex: &c9Hex)
                    }, label: {
                        GeneratePaletteButton()
                        
                    })
                    
                    PickedImageView(image: self.image)
                    
                    ColorBlockGridView(cOne: $cOne,
                                       cTwo: $cTwo,
                                       cThree: $cThree,
                                       cFour: $cFour,
                                       cFive: $cFive,
                                       cSix: $cSix,
                                       cSeven: $cSeven,
                                       cEight: $cEight,
                                       cNine: $cNine,
                                       c1Hex: $c1Hex,
                                       c2Hex: $c2Hex,
                                       c3Hex: $c3Hex,
                                       c4Hex: $c4Hex,
                                       c5Hex: $c5Hex,
                                       c6Hex: $c6Hex,
                                       c7Hex: $c7Hex,
                                       c8Hex: $c8Hex,
                                       c9Hex: $c9Hex)
                    
                    Spacer()
                    
                    AdView()
                        .frame(height: 50)
                    
                    Spacer()
                    
                }
                .sheet(item: $activeSheet) { item in
                    switch item {
                    case .library:
                        ImagePicker(selectedImage: self.$image, sourceType: .photoLibrary)
                    case .camera:
                        ImagePicker(selectedImage: self.$image, sourceType: .camera)
                    }
                }
            }
            .tabItem{
                Image(systemName: "square.grid.3x3.fill")
            }
            .tag(2)
            
            ZStack{
                AnimatedBackgroundView().edgesIgnoringSafeArea(.all)
                    .blur(radius: 50)
                    .scaleEffect(1.5)
                Text("TODO: Saved color palette functionality")
            }
            .tabItem {
                    Image(systemName: "list.dash")
            }
            .tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SingleColorBlockView: View {
    var color: UIColor
    var hex: String
    var colorView: UIView
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color(color))
            .shadow(radius: 8)
            .onTapGesture {
                UIPasteboard.general.setValue(hex, forPasteboardType: kUTTypePlainText as String)
                let title: String = "Copied color \(hex)!"
                let banner = NotificationBanner(title: title,
                                                leftView: colorView,
                                                style: .info)
                banner.show()
            }
        
    }
}


struct ColorBlockGridView: View {
    @Binding var cOne: UIColor
    @Binding var cTwo: UIColor
    @Binding var cThree: UIColor
    @Binding var cFour: UIColor
    @Binding var cFive: UIColor
    @Binding var cSix: UIColor
    @Binding var cSeven: UIColor
    @Binding var cEight: UIColor
    @Binding var cNine: UIColor
    
    @Binding var c1Hex: String
    @Binding var c2Hex: String
    @Binding var c3Hex: String
    @Binding var c4Hex: String
    @Binding var c5Hex: String
    @Binding var c6Hex: String
    @Binding var c7Hex: String
    @Binding var c8Hex: String
    @Binding var c9Hex: String
    
    
    
    
    var body: some View {
        VStack (spacing: 12){
            HStack {
                SingleColorBlockView(color: cOne,
                                     hex: c1Hex,
                                     colorView: UIView(frame: CGRect(x: 0,
                                                                     y: 0,
                                                                     width: 100,
                                                                     height: 100)))
                SingleColorBlockView(color: cTwo,
                                     hex: c2Hex,
                                     colorView: UIView(frame: CGRect(x: 0,
                                                                     y: 0,
                                                                     width: 100,
                                                                     height: 100)))
                SingleColorBlockView(color: cThree,
                                     hex: c3Hex,
                                     colorView: UIView(frame: CGRect(x: 0,
                                                                     y: 0,
                                                                     width: 100,
                                                                     height: 100)))
            }
            
            HStack {
                SingleColorBlockView(color: cFour,
                                     hex: c4Hex,
                                     colorView: UIView(frame: CGRect(x: 0,
                                                                     y: 0,
                                                                     width: 100,
                                                                     height: 100)))
                SingleColorBlockView(color: cFive,
                                     hex: c5Hex,
                                     colorView: UIView(frame: CGRect(x: 0,
                                                                     y: 0,
                                                                     width: 100,
                                                                     height: 100)))
                SingleColorBlockView(color: cSix,
                                     hex: c6Hex,
                                     colorView: UIView(frame: CGRect(x: 0,
                                                                     y: 0,
                                                                     width: 100,
                                                                     height: 100)))
            }
            
            HStack {
                SingleColorBlockView(color: cSeven,
                                     hex: c7Hex,
                                     colorView: UIView(frame: CGRect(x: 0,
                                                                     y: 0,
                                                                     width: 100,
                                                                     height: 100)))
                SingleColorBlockView(color: cEight,
                                     hex: c8Hex,
                                     colorView: UIView(frame: CGRect(x: 0,
                                                                     y: 0,
                                                                     width: 100,
                                                                     height: 100)))
                SingleColorBlockView(color: cNine,
                                     hex: c9Hex,
                                     colorView: UIView(frame: CGRect(x: 0,
                                                                     y: 0,
                                                                     width: 100,
                                                                     height: 100)))
            }
        }
    }
}

struct UploadedImageHolderView: View {
    @Binding var image: UIImage
    
    var body: some View {
        Image(uiImage: image)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 200)
    }
}

struct GeneratePaletteButton: View {
    var body: some View {
        HStack {
            Image(systemName: "square.grid.3x3")
            Text("Generate Palette")
        }
        .padding(10)
        .frame(height: 50)
        .background(Color.blue)
        .foregroundColor(.white)
        .font(.system(size: 20,
                      weight: .bold,
                      design: .default))
        .cornerRadius(10)
    }
}

struct PickImageButton: View {
    var body: some View {
        HStack {
            Image(systemName: "photo")
            Text("Pick Image")
        }
        .padding(10)
        .frame(height: 50)
        .background(Color.blue)
        .foregroundColor(.white)
        .font(.system(size: 20,
                      weight: .bold,
                      design: .default))
        .cornerRadius(10)
    }
}

struct TakeImageButton: View {
    var body: some View {
        HStack {
            Image(systemName: "camera")
            Text("Take Image")
        }
        .padding(10)
        .frame(height: 50)
        .background(Color.blue)
        .foregroundColor(.white)
        .font(.system(size: 20,
                      weight: .bold,
                      design: .default))
        .cornerRadius(10)
        
        
    }
}

struct PickedImageView: View {
    var image: UIImage
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .scaledToFit()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 150)
            .edgesIgnoringSafeArea(.all)
        
    }
    
}


struct AnimatedBackgroundView: View {
    @State var start = UnitPoint(x: 0, y: -2)
    @State var end = UnitPoint(x: 4, y: 0)
    
    let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    let colors = [Color.blue,
                  Color.red,
                  Color.purple,
                  Color.pink,
                  Color.yellow,
                  Color.green,
                  Color.orange]
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: colors), startPoint: start, endPoint: end)
            .animation(Animation.easeInOut(duration: 6.0)
                        .repeatForever()
            ).onReceive(timer, perform: { _ in
                self.start = UnitPoint(x: 4, y: 0)
                self.end = UnitPoint(x: 0, y: 2)
                self.start = UnitPoint(x: -4, y: 20)
                self.start = UnitPoint(x: 4, y: 0)
            })
    }
    
}

struct AdView: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<AdView>) -> GADBannerView {
        
        let banner = GADBannerView(adSize: kGADAdSizeBanner)
        
        banner.adUnitID = "ca-app-pub-6185838911408177/7294727353"
        banner.rootViewController = UIApplication.shared.windows.first?.rootViewController
        banner.load(GADRequest())
        return banner
    }
    func updateUIView(_ uiView: GADBannerView, context: UIViewRepresentableContext<AdView>) {
        
    }
}

enum ActiveSheet: Identifiable {
    case camera, library
    
    var id: Int {
        hashValue
    }
}

func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
}

func addColor(_ color1: UIColor, with color2: UIColor) -> UIColor {
    var (r1, g1, b1, a1) = (CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0))
    var (r2, g2, b2, a2) = (CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0))
    
    color1.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
    color2.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
    
    // add the components, but don't let them go above 1.0
    return UIColor(red: min(r1 + r2, 1), green: min(g1 + g2, 1), blue: min(b1 + b2, 1), alpha: (a1 + a2) / 2)
}

func multiplyColor(_ color: UIColor, by multiplier: CGFloat) -> UIColor {
    var (r, g, b, a) = (CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0))
    color.getRed(&r, green: &g, blue: &b, alpha: &a)
    return UIColor(red: r * multiplier, green: g * multiplier, blue: b * multiplier, alpha: a)
}

func +(color1: UIColor, color2: UIColor) -> UIColor {
    return addColor(color1, with: color2)
}

func *(color: UIColor, multiplier: Double) -> UIColor {
    return multiplyColor(color, by: CGFloat(multiplier))
}

func compressImage(_ image: UIImage) -> UIImage {
    let actualHeight: CGFloat = image.size.height
    let actualWidth:CGFloat = image.size.width
    let imgRatio:CGFloat = actualWidth/actualHeight
    let maxWidth:CGFloat = 1024.0
    let resizedHeight:CGFloat = maxWidth/imgRatio
    let compressionQuality:CGFloat = 0.5
    
    let rect:CGRect = CGRect(x: 0, y: 0, width: maxWidth, height: resizedHeight)
    UIGraphicsBeginImageContext(rect.size)
    image.draw(in: rect)
    let img: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    let imageData:Data = img.jpegData(compressionQuality: compressionQuality)!
    UIGraphicsEndImageContext()
    
    return UIImage(data: imageData)!
}

func generatePalette(_ image: UIImage,
                     cOne: inout UIColor,
                     cTwo: inout UIColor,
                     cThree: inout UIColor,
                     cFour: inout UIColor,
                     cFive: inout UIColor,
                     cSix: inout UIColor,
                     cSeven: inout UIColor,
                     cEight: inout UIColor,
                     cNine: inout UIColor,
                     c1Hex: inout String,
                     c2Hex: inout String,
                     c3Hex: inout String,
                     c4Hex: inout String,
                     c5Hex: inout String,
                     c6Hex: inout String,
                     c7Hex: inout String,
                     c8Hex: inout String,
                     c9Hex: inout String) {
    let colors = ColorThief.getPalette(from: image,
                                           colorCount: 5,
                                           quality: 1,
                                           ignoreWhite: true)
    if(image.size.width != 0) {
        cOne = (colors?[0].makeUIColor())!
        cThree = (colors?[1].makeUIColor())!
        cNine = (colors?[2].makeUIColor())!
        cSeven = (colors?[3].makeUIColor())!
        cFive = (colors?[4].makeUIColor())!
        
        cTwo = cOne * 0.50 + cThree * 0.50
        cFour = cOne * 0.50 + cSeven * 0.50
        cSix = cThree * 0.50 + cNine * 0.50
        cEight = cSeven * 0.50 + cNine * 0.50
        
        c1Hex = HexFromUIColor(color: cOne).hexString
        c2Hex = HexFromUIColor(color: cTwo).hexString
        c3Hex = HexFromUIColor(color: cThree).hexString
        c4Hex = HexFromUIColor(color: cFour).hexString
        c5Hex = HexFromUIColor(color: cFive).hexString
        c6Hex = HexFromUIColor(color: cSix).hexString
        c7Hex = HexFromUIColor(color: cSeven).hexString
        c8Hex = HexFromUIColor(color: cEight).hexString
        c9Hex = HexFromUIColor(color: cNine).hexString
    }
}

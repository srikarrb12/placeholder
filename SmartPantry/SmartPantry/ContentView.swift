//
//  ContentView.swift
//  SmartPantry
//
//  Created by Long Lam on 3/4/24.
//

import SwiftUI
import AVFoundation
import UIKit

struct ContentView: View {
    var body: some View {
//        VStack {
//            Button("Button Text", action: { print("Tuan Cai") })
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
        CameraView()
    }
}
struct CameraView: View {
    @StateObject var camera = CameraModel()
    var body: some View {
        ZStack{
            CameraPreview(camera: camera).ignoresSafeArea(.all, edges: .all)
            VStack{
                if camera.isTaken {
                    HStack {
                        Spacer()
                        Button(action: camera.reTake, label: {
                            Image(systemName: "arrow.triangle.2.circlepath.camera").foregroundColor(.black).padding().background(Color.white).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        }).padding(.trailing, 10)
                    }
                    Spacer()
                }
                Spacer()
                HStack {
                    
                    if camera.isTaken{
                        Button(action: {if !camera.isSaved{camera.savePic()}}, label: {
                            Text(camera.isSaved ? "Saved" : "Save").foregroundColor(.black).fontWeight(.semibold).padding(.vertical, 10).padding(.horizontal, 20).background(Color.white).clipShape(Capsule())
                        }).padding(.leading)
                        Spacer()
                    } else {
                        Button(action: camera.takePic, label: {
                            ZStack {
                                Circle().fill(Color.white).frame(width:65, height: 65 )
                                Circle().stroke(Color.white, lineWidth:2).frame(width:75,  height: 75)
                            }
                        })
                    }
                }.frame(height: 75)
            }
        }.onAppear(perform: {
            camera.Check()
        })
    }
}

//Camera Model
class CameraModel: NSObject, ObservableObject, AVCapturePhotoCaptureDelegate {
    @Published var isTaken = false
    @Published var session = AVCaptureSession()
    @Published var alert = false
    @Published var output = AVCapturePhotoOutput()
    @Published var preview : AVCaptureVideoPreviewLayer!
    @Published var isSaved = false
    @Published var picData = Data(count: 0)
    func Check() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            //Setting up session
            setUp()
            return
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) {(status) in
                if status {
                    self.setUp()
                }
            }
        case .denied:
            self.alert.toggle()
            return
        default:
            return
        }
    }
    func setUp() {
        // setting up the camera
        do {
            self.session.beginConfiguration()
            let device = AVCaptureDevice.default(.builtInDualCamera,for: .video,position: .back)
            let input = try AVCaptureDeviceInput(device: device!)
            if self.session.canAddInput(input) {
                self.session.addInput(input)
            }
            if self.session.canAddOutput(self.output) {
                self.session.addOutput(self.output)
            }
            self.session.commitConfiguration()
        } catch {
            print(error.localizedDescription)
        }
    }
    func takePic() {
        DispatchQueue.global(qos: .background).async {
//            print("takePic() is called")
            self.output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
//            self.session.stopRunning()
            DispatchQueue.main.async {
                withAnimation{self.isTaken.toggle()}
            }
        }
    }
//    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
//        print("pic taken...")
//        if error != nil {
//            return
//        }
//        
//        guard let imageData = photo.fileDataRepresentation() else {return}
//        self.picData = imageData
//    }
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
//        print("pic taken...")
        if error != nil {
            print(error?.localizedDescription ?? "Unknown error")
            self.session.stopRunning() // Stop the session after the photo capture process has completed
            return
        }

        guard let imageData = photo.fileDataRepresentation() else {
            print("Unable to get file data representation")
            self.session.stopRunning() // Stop the session if unable to get file data representation
            return
        }
        self.picData = imageData
        print(self.picData)
        self.session.stopRunning() // Stop the session after getting the file data representation
    }
    
    func reTake() {
        DispatchQueue.global(qos: .background).async {
            self.session.startRunning()
            DispatchQueue.main.async {
                withAnimation{self.isTaken.toggle()}
                // clearing
                self.isSaved = false
            }
        }
    }
    
    func savePic() {
        let image = UIImage(data: self.picData)!
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        self.isSaved = true
//        print(type(of: self.picData))
//        print(self.picData)
//        print("save successfully ....")
    }
}
struct CameraPreview: UIViewRepresentable{
    @ObservedObject var camera: CameraModel
    func makeUIView(context: Context) ->  UIView{
        let view = UIViewType(frame: UIScreen.main.bounds)
        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
        camera.preview.frame = view.frame
        camera.preview.videoGravity = .resizeAspectFill
        view.layer.addSublayer(camera.preview)
        camera.session.startRunning()
        return view
    }
    func updateUIView(_ uiView: UIView, context: Context) {
        // No need to add any code here
    }
}
#Preview {
    ContentView()
}

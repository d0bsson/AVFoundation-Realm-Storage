//
//  CameraViewController.swift
//  AVFoundation+Storage+Realm
//
//  Created by d0bsson on 25.01.2024.
//
import AVFoundation
import UIKit

class CameraViewController: UIViewController {
    var session: AVCaptureSession!
    let output = AVCapturePhotoOutput()
    var previewLayer = AVCaptureVideoPreviewLayer()
    
    //MARK: - Buttons
    lazy var dissmisBtn: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(systemName: "xmark"), for: .normal)
        return $0
    }(UIButton(primaryAction: dismissAction))
    
    lazy var dismissAction = UIAction { [weak self] _ in
        self?.dismiss(animated: true)
    }
    
    lazy var shotBtn: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 50
        $0.layer.borderWidth = 7
        $0.layer.borderColor = UIColor.white.cgColor
        $0.backgroundColor = .lightGray
        return $0
    }(UIButton(primaryAction: takePhoto))
    
    lazy var takePhoto = UIAction { _ in
        self.output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCamera()
        view.layer.addSublayer(previewLayer)
        view.addSubview(dissmisBtn)
        view.addSubview(shotBtn)
        setConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        previewLayer.frame = view.bounds
    }
    
    //MARK: - Constraints
    private func setConstraints() {
        NSLayoutConstraint.activate([
            dissmisBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 48),
            dissmisBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            shotBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shotBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            shotBtn.heightAnchor.constraint(equalToConstant: 100),
            shotBtn.widthAnchor.constraint(equalToConstant: 100)
        ])
    }

    private func setUpCamera(){
        session = AVCaptureSession()
        
        guard let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
            return
        }
        
        do {
            let input = try AVCaptureDeviceInput(device: device)
            
            if session.canAddInput(input),
               session.canAddOutput(output){

                session.addInput(input)
                session.addOutput(output)
            }
            
            previewLayer = AVCaptureVideoPreviewLayer(session: session)
            previewLayer.videoGravity = .resizeAspectFill
            
            DispatchQueue.global(qos: .userInitiated).async {
                self.session.startRunning()
            }
            
            previewLayer.frame = view.bounds
            view.layer.addSublayer(previewLayer)
            
        } catch{
            print("Error?")
        }
    }

}

extension CameraViewController: AVCapturePhotoCaptureDelegate {
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
       
//        guard let data = photo.fileDataRepresentation() else {
//            return
//        }
//        
//        if let image = UIImage(data: data){
//            self.imageView.image = image
//            
//            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
//        }
    }
}

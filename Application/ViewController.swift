//
//  ViewController.swift
//  swift_metal
//
//  Created by snowapril on 3/24/24.
//

import MetalKit

#if os(iOS) || os(tvOS)
import UIKit
typealias PlatformViewController = UIViewController
#else
import AppKit
typealias PlatformViewController = NSViewController
#endif

class ViewController: PlatformViewController {
    
    var mtkView : MTKView!
    var renderer : BaseRenderer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let device = MTLCreateSystemDefaultDevice() else {
            fatalError("Failed to create system default device")
        }
        
        mtkView = MTKView(frame: view.frame, device: device)
        view.addSubview(mtkView)
        
        NSLayoutConstraint.activate([
            mtkView.topAnchor.constraint(equalTo: view.topAnchor),
            mtkView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mtkView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mtkView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
        
        // Set the pixel formats of the render destination.
        mtkView.depthStencilPixelFormat = .depth32Float_stencil8
        mtkView.colorPixelFormat = .bgra8Unorm_srgb
        
        renderer = BaseRenderer(device: device)
        mtkView.delegate = renderer
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}


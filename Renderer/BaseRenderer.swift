//
//  BaseRenderer.swift
//  swift_metal
//
//  Created by snowapril on 3/24/24.
//

import MetalKit

class BaseRenderer : NSObject {
    var device: MTLDevice!
    
    init(device: MTLDevice!) {
        self.device = device
    }
}

extension BaseRenderer : MTKViewDelegate {
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        // Empty
    }
    
    func draw(in view: MTKView) {
        // Empty
    }
}

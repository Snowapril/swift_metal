//
//  MeshRenderer.swift
//  swift_metal
//
//  Created by snowapril on 3/24/24.
//

import MetalKit

class MeshRenderer : RendererProtocol {
    var device: MTLDevice!
}

extension MeshRenderer {
    func resize(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        // Empty
    }
    
    func draw(in view: MTKView, commandBuffer: MTLCommandBuffer!) {
        // Empty
    }
}

//
//  PostProcessRenderer.swift
//  swift_metal
//
//  Created by snowapril on 3/24/24.
//

import MetalKit

class PostProcessRenderer: RendererProtocol {
    var device: MTLDevice!

    init(device: MTLDevice!, desc: RendererDescriptor) {
        self.device = device
    }
}

extension PostProcessRenderer {
    func resize(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        // Empty
    }

    func draw(in view: MTKView, commandBuffer: MTLCommandBuffer!) {
        guard let pass = view.currentRenderPassDescriptor else {
            fatalError("Cannot get RenderPassDescriptor from the current view")
        }

        let clearColor: MTLClearColor = MTLClearColor(
            red: Double.random(in: Range(uncheckedBounds: (0.0, 1.0))),
            green: Double.random(in: Range(uncheckedBounds: (0.0, 1.0))),
            blue: Double.random(in: Range(uncheckedBounds: (0.0, 1.0))),
            alpha: 1.0
        )

        pass.colorAttachments[0].clearColor = clearColor
        if let encoder = commandBuffer.makeRenderCommandEncoder(descriptor: pass) {
            // Empty encoder for only clearing
            encoder.endEncoding()
        }
    }
}

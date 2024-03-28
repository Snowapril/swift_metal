//
//  BaseRenderer.swift
//  swift_metal
//
//  Created by snowapril on 3/24/24.
//

import MetalKit

class RendererDelegate : NSObject {
    var device: MTLDevice!
    var commandQueue: MTLCommandQueue!
    var renderers: [RendererProtocol]
    
    init(device: MTLDevice!, args: [String]) {
        self.device = device
        self.commandQueue = device.makeCommandQueue()
        
        let rendererDescriptor = RendererContext(device: self.device, args: args)
        
        self.renderers = []
        self.renderers.append( TerrainRenderer(device: device, desc: rendererDescriptor))
    }
}

extension RendererDelegate : MTKViewDelegate {
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        for renderer in self.renderers {
            renderer.resize(view, drawableSizeWillChange: size)
        }
    }
    
    func draw(in view: MTKView) {
        let descriptor : MTLCommandBufferDescriptor = {
            var desc = MTLCommandBufferDescriptor();
            desc.retainedReferences = true
            desc.errorOptions = .encoderExecutionStatus
            return desc
        }();
        
        guard let commandBuffer = self.commandQueue.makeCommandBuffer(descriptor: descriptor) else {
            fatalError("Failed to make MTLCommandBuffer")
        }
        
        for renderer in self.renderers {
            renderer.draw(in: view, commandBuffer: commandBuffer)
        }
    }
}

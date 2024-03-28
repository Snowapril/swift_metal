//
//  TerrainRenderer.swift
//  swift_metal
//
//  Created by snowapril on 3/28/24.
//

import MetalKit


class TerrainRenderer : RendererProtocol {
    var device: MTLDevice!
    
    var patchBuffer : MTLBuffer!
    var counterBuffer : MTLBuffer!
    var descBuffer : MTLBuffer!
    
    var terrainPatchGenPso : MTLComputePipelineState!
    
    init(device: MTLDevice!, context: RendererContext) {
        self.device = device
    }
}

extension TerrainRenderer {
    
    func resize(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        // Empty
    }
    
    func draw(in view: MTKView, commandBuffer: MTLCommandBuffer!) {
        // Empty
    }
}

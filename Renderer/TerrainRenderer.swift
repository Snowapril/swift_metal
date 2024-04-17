//
//  TerrainRenderer.swift
//  swift_metal
//
//  Created by snowapril on 3/28/24.
//

import MetalKit

class TerrainRenderer: RendererProtocol {
    var device: MTLDevice!

    var patchBuffer: MTLBuffer!
    var counterBuffer: MTLBuffer!
    var descBuffer: MTLBuffer!

    var terrainPatchGenPso: MTLComputePipelineState!

    init(device: MTLDevice!, desc: RendererDescriptor) {
        self.device = device

        self.counterBuffer = device.makeBuffer(
            length: MemoryLayout<UInt32>.size,
            options: .storageModeShared
        )
        self.descBuffer = device.makeBuffer(
            length: MemoryLayout<TerrainPatchGenDesc>.size,
            options: .storageModeShared
        )
        self.patchBuffer = device.makeBuffer(
            length: MemoryLayout<TerrainPatch>.size * Int(desc.maxNumPatches),
            options: .storageModePrivate
        )

        let functionDescriptor = MTLFunctionDescriptor()
        functionDescriptor.name = "terrainPatchGen"

        guard let defaultLibrary = device.makeDefaultLibrary() else {
            fatalError("Failed to get default library")
        }

        guard
            let terrainPatchGenFunction = try? defaultLibrary.makeFunction(
                descriptor: functionDescriptor
            )
        else {
            fatalError("Failed to create function : \(functionDescriptor.name!)")
        }

        terrainPatchGenPso = try! device.makeComputePipelineState(function: terrainPatchGenFunction)
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

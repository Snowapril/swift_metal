//
//  RendererDescriptor.swift
//  swift_metal
//
//  Created by snowapril on 3/28/24.
//

import MetalKit
import simd

struct RendererDescriptor {
    lazy var startPos: simd_float3 = simd_float3(0, 0, 0)
    lazy var fov: simd_float1 = simd_float1(60)
    lazy var cameraSpeed: simd_float1 = simd_float1(1)
    lazy var maxNumPatches: uint64 = 1 << 32
    // ...
}

class RendererContext {
    var defaultLibrary: MTLLibrary!
    let descriptor: RendererDescriptor
    
    init(device: MTLDevice!, args: [String]) {
        guard let defaultLibrary = device.makeDefaultLibrary() else {
            fatalError("Failed to create system default library")
        }
        descriptor = RendererDescriptor()
        // todo(snowapril) : parse args.
    }
}

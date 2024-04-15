//
//  RendererDescriptor.swift
//  swift_metal
//
//  Created by snowapril on 3/28/24.
//

import MetalKit
import simd

struct RendererDescriptor {
    var startPos: simd_float3 = simd_float3(0, 0, 0)
    var fov: simd_float1 = simd_float1(60)
    var cameraSpeed: simd_float1 = simd_float1(1)
    var maxNumPatches: UInt32 = 1 << 16
    // ...
}

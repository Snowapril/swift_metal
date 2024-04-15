//
//  MeshRenderer.swift
//  swift_metal
//
//  Created by snowapril on 3/24/24.
//

import MetalKit

class MeshRenderer: RendererProtocol {
    var device: MTLDevice!
    let icosahedron: Mesh

    init(device: MTLDevice!, desc: RendererDescriptor) {
        self.device = device

        do {
            let bufferAllocator = MTKMeshBufferAllocator(device: device)

            let unitInscribe = sqrtf(3.0) / 12.0 * (3.0 + sqrtf(5.0))

            let icosahedronMDLMesh = MDLMesh.newIcosahedron(
                withRadius: 1 / unitInscribe,
                inwardNormals: false,
                allocator: bufferAllocator
            )

            let icosahedronDescriptor = MDLVertexDescriptor()

            guard
                let positionAttribute = icosahedronDescriptor.attributes.object(at: 0)
                    as? MDLVertexAttribute
            else { fatalError("Failed to get attribute") }
            positionAttribute.name = MDLVertexAttributePosition
            positionAttribute.format = .float4
            positionAttribute.offset = 0
            positionAttribute.bufferIndex = Int(0)

            guard let layout = icosahedronDescriptor.layouts.object(at: 0) as? MDLVertexBufferLayout
            else { fatalError("Failed to get vertex buffer layout") }
            layout.stride = MemoryLayout<SIMD4<Float>>.stride

            icosahedronMDLMesh.vertexDescriptor = icosahedronDescriptor

            do {
                let mtkMesh = try MTKMesh(mesh: icosahedronMDLMesh, device: device)
                icosahedron = Mesh(mtkMesh: mtkMesh)
            }
            catch {
                fatalError("Failed to create MTKMesh: \(error.localizedDescription)")
            }
        }
    }
}

extension MeshRenderer {
    func resize(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        // Empty
    }

    func draw(in view: MTKView, commandBuffer: MTLCommandBuffer!) {
        // Empty
    }
}

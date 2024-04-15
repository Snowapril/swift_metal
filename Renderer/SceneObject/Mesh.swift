//
//  Mesh.swift
//  swift_metal
//
//  Created by snowapril on 4/7/24.
//

import MetalKit

class Mesh {
    let mtkMesh: MTKMesh
    let submeshes: [SubMesh]

    init(mtkMesh: MTKMesh) {
        self.mtkMesh = mtkMesh

        var submeshes = [SubMesh]()
        for submesh in mtkMesh.submeshes {
            submeshes.append(SubMesh(mtkSubmesh: submesh))
        }
        self.submeshes = submeshes
    }

    init(
        mdlMesh: MDLMesh,
        vertexDesc: MDLVertexDescriptor,
        textureLoader: MTKTextureLoader,
        device: MTLDevice
    ) {
        mdlMesh.addTangentBasis(
            forTextureCoordinateAttributeNamed: MDLVertexAttributeTextureCoordinate,
            normalAttributeNamed: MDLVertexAttributeNormal,
            tangentAttributeNamed: MDLVertexAttributeTangent
        )
        mdlMesh.addTangentBasis(
            forTextureCoordinateAttributeNamed: MDLVertexAttributeTextureCoordinate,
            normalAttributeNamed: MDLVertexAttributeTangent,
            tangentAttributeNamed: MDLVertexAttributeBitangent
        )
        mdlMesh.vertexDescriptor = vertexDesc

        do {
            let mtkMesh = try MTKMesh(mesh: mdlMesh, device: device)
            assert(mtkMesh.submeshes.count == mdlMesh.submeshes?.count)
            self.mtkMesh = mtkMesh
        }
        catch {
            fatalError(
                "Failed to create MTKMesh from given MDLMesh : \(error.localizedDescription)"
            )
        }

        var submeshes = [SubMesh]()
        for index in 0..<self.mtkMesh.submeshes.count {
            if let mdlSubmesh = mdlMesh.submeshes?.object(at: index) as? MDLSubmesh {
                submeshes.append(
                    SubMesh(
                        mtkSubmesh: self.mtkMesh.submeshes[index],
                        mdlSubmesh: mdlSubmesh,
                        textureLoader: textureLoader
                    )
                )
            }
        }
        self.submeshes = submeshes
    }
}

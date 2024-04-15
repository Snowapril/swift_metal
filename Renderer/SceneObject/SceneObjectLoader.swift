//
//  SceneObjectLoader.swift
//  swift_metal
//
//  Created by snowapril on 3/24/24.
//

import MetalKit

class SceneObjectLoader {
    static func loadMesh(url: URL, vertexDesc: MDLVertexDescriptor, device: MTLDevice) -> [Mesh] {
        let bufferAllocator = MTKMeshBufferAllocator(device: device)
        let mdlAsset = MDLAsset(url: url, vertexDescriptor: nil, bufferAllocator: bufferAllocator)
        let textureLoader = MTKTextureLoader(device: device)

        var meshes = [Mesh]()
        for child in mdlAsset.childObjects(of: MDLObject.self) {
            let assetMeshes = makeMeshes(
                object: child,
                vertexDesc: vertexDesc,
                textureLoader: textureLoader,
                device: device
            )
            meshes.append(contentsOf: assetMeshes)
        }
        return meshes
    }

    static func makeMeshes(
        object: MDLObject,
        vertexDesc: MDLVertexDescriptor,
        textureLoader: MTKTextureLoader,
        device: MTLDevice
    ) -> [Mesh] {
        var meshes = [Mesh]()
        if let mdlMesh = object as? MDLMesh {
            let newMesh = Mesh(
                mdlMesh: mdlMesh,
                vertexDesc: vertexDesc,
                textureLoader: textureLoader,
                device: device
            )
            meshes.append(newMesh)
        }

        if object.conforms(to: MDLObjectContainerComponent.self) {
            for child in object.children.objects {
                let childMeshes = makeMeshes(
                    object: object,
                    vertexDesc: vertexDesc,
                    textureLoader: textureLoader,
                    device: device
                )
                meshes.append(contentsOf: childMeshes)
            }
        }

        return meshes
    }
}

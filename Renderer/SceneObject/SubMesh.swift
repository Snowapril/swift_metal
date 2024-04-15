//
//  SubMesh.swift
//  swift_metal
//
//  Created by snowapril on 4/7/24.
//

import MetalKit

class SubMesh {
    let mtkSubMesh: MTKSubmesh
    var material: Material?

    init(mtkSubmesh: MTKSubmesh) {
        self.mtkSubMesh = mtkSubmesh
    }

    init(
        mtkSubmesh: MTKSubmesh,
        mdlSubmesh: MDLSubmesh,
        textureLoader: MTKTextureLoader
    ) {
        self.mtkSubMesh = mtkSubmesh
        if let material = mdlSubmesh.material {
            self.material = Material(
                semantics: [.baseColor, .tangentSpaceNormal, .specular],
                mdlMaterial: material,
                textureLoader: textureLoader
            )
        }
    }
}

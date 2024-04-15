//
//  Material.swift
//  swift_metal
//
//  Created by snowapril on 3/25/24.
//

import MetalKit

class Material {

    lazy var textures: [MDLMaterialSemantic: MTLTexture] = [:]

    init(
        semantics: [MDLMaterialSemantic],
        mdlMaterial: MDLMaterial,
        textureLoader: MTKTextureLoader
    ) {
        for semantic in semantics {
            if let loadedTexture = Material.loadTexture(
                semantic: semantic,
                mdlMaterial: mdlMaterial,
                textureLoader: textureLoader
            ) {
                textures[semantic] = loadedTexture
            }
        }
    }

    static private func loadTexture(
        semantic: MDLMaterialSemantic,
        mdlMaterial: MDLMaterial,
        textureLoader: MTKTextureLoader
    ) -> MTLTexture? {

        var loadedTexture: MTLTexture? = nil

        for property in mdlMaterial.properties(with: semantic) {
            let textureLoaderOptions: [MTKTextureLoader.Option: Any] = [
                .textureUsage: MTLTextureUsage.shaderRead.rawValue,
                .textureStorageMode: MTLStorageMode.private.rawValue,
            ]

            switch property.type {
            case .string:
                if let stringValue = property.stringValue {
                    if let texture = try? textureLoader.newTexture(
                        name: stringValue,
                        scaleFactor: 1.0,
                        bundle: nil,
                        options: textureLoaderOptions
                    ) {
                        loadedTexture = texture

                    }
                }
            case .URL:
                if let url = property.urlValue {
                    if let texture = try? textureLoader.newTexture(
                        URL: url,
                        options: textureLoaderOptions
                    ) {
                        loadedTexture = texture
                    }
                }
            default:
                fatalError("[Material.loadTexture] Unhandled case \(property.type)")
            }
        }

        return loadedTexture
    }
}

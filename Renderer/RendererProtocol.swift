//
//  BaseRenderer.swift
//  swift_metal
//
//  Created by snowapril on 3/24/24.
//

import MetalKit

protocol RendererProtocol {
    var device: MTLDevice! { get }

    func resize(_ view: MTKView, drawableSizeWillChange size: CGSize)
    func draw(in view: MTKView, commandBuffer: MTLCommandBuffer!)
}

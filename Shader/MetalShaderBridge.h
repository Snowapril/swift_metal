//
//  MetalShaderBridge.h
//  swift_metal
//
//  Created by snowapril on 3/28/24.
//

#pragma once

#import <simd/simd.h>

struct TerrainPatch
{
    simd::float3 center;
    float width;
};

struct TerrainPatchGenDesc
{
    float distance;
    float baseHeight;
    float heightScale;
};

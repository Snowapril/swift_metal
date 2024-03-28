//
//  TerrainPatchGen.metal
//  swift_metal
//
//  Created by snowapril on 3/28/24.
//

#include <metal_stdlib>
using namespace metal;

#include "MetalShaderBridge.h"

struct TerrainPatchGenArgBuffer
{
    device atomic_uint* patchCounter [[id(0)]];
    device TerrainPatch* genPathces [[id(1)]];
    constant TerrainPatchGenDesc* genDesc [[id(2)]];
};

kernel void terrainPatchGen(const uint3 threadPosInGrid [[ thread_position_in_grid ]],
                            const uint3 threadsPerGrid  [[threads_per_grid]],
                            constant TerrainPatchGenArgBuffer* desc [[buffer(0)]])
{
    
}

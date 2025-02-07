// RUN: %dxc -T ps_6_0 -E main -O0 %s -spirv | FileCheck %s

Texture1D   <float4> t : register(t1);
SamplerState gSampler : register(s2);

// CHECK: OpCapability MinLod

float4 main(uint clamp : A) : SV_Target {
    if (clamp < 0) {
      return t.Sample(gSampler, 0.5f, 2, float(clamp));
    }
    return float4(0, 0, 0, 0);
}

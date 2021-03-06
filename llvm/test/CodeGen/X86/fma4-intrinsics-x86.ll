; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mattr=+fma4,-fma -show-mc-encoding | FileCheck %s --check-prefix=CHECK
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mattr=+fma4,+fma -show-mc-encoding | FileCheck %s --check-prefix=CHECK

; VFMADD
define <4 x float> @test_x86_fma4_vfmadd_ss(<4 x float> %a0, <4 x float> %a1, <4 x float> %a2) #0 {
; CHECK-LABEL: test_x86_fma4_vfmadd_ss:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfmaddss %xmm2, %xmm1, %xmm0, %xmm0 # encoding: [0xc4,0xe3,0xf9,0x6a,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %res = call <4 x float> @llvm.x86.fma4.vfmadd.ss(<4 x float> %a0, <4 x float> %a1, <4 x float> %a2)
  ret <4 x float> %res
}

define <4 x float> @test_x86_fma4_vfmadd_bac_ss(<4 x float> %a0, <4 x float> %a1, <4 x float> %a2) #0 {
; CHECK-LABEL: test_x86_fma4_vfmadd_bac_ss:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfmaddss %xmm2, %xmm0, %xmm1, %xmm0 # encoding: [0xc4,0xe3,0xf1,0x6a,0xc2,0x00]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %res = call <4 x float> @llvm.x86.fma4.vfmadd.ss(<4 x float> %a1, <4 x float> %a0, <4 x float> %a2)
  ret <4 x float> %res
}
declare <4 x float> @llvm.x86.fma4.vfmadd.ss(<4 x float>, <4 x float>, <4 x float>)

define <2 x double> @test_x86_fma4_vfmadd_sd(<2 x double> %a0, <2 x double> %a1, <2 x double> %a2) #0 {
; CHECK-LABEL: test_x86_fma4_vfmadd_sd:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfmaddsd %xmm2, %xmm1, %xmm0, %xmm0 # encoding: [0xc4,0xe3,0xf9,0x6b,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %res = call <2 x double> @llvm.x86.fma4.vfmadd.sd(<2 x double> %a0, <2 x double> %a1, <2 x double> %a2)
  ret <2 x double> %res
}

define <2 x double> @test_x86_fma4_vfmadd_bac_sd(<2 x double> %a0, <2 x double> %a1, <2 x double> %a2) #0 {
; CHECK-LABEL: test_x86_fma4_vfmadd_bac_sd:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfmaddsd %xmm2, %xmm0, %xmm1, %xmm0 # encoding: [0xc4,0xe3,0xf1,0x6b,0xc2,0x00]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %res = call <2 x double> @llvm.x86.fma4.vfmadd.sd(<2 x double> %a1, <2 x double> %a0, <2 x double> %a2)
  ret <2 x double> %res
}
declare <2 x double> @llvm.x86.fma4.vfmadd.sd(<2 x double>, <2 x double>, <2 x double>)

define <4 x float> @test_x86_fma_vfmadd_ps(<4 x float> %a0, <4 x float> %a1, <4 x float> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfmadd_ps:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfmaddps %xmm2, %xmm1, %xmm0, %xmm0 # encoding: [0xc4,0xe3,0xf9,0x68,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = call <4 x float> @llvm.fma.v4f32(<4 x float> %a0, <4 x float> %a1, <4 x float> %a2)
  ret <4 x float> %1
}

define <2 x double> @test_x86_fma_vfmadd_pd(<2 x double> %a0, <2 x double> %a1, <2 x double> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfmadd_pd:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfmaddpd %xmm2, %xmm1, %xmm0, %xmm0 # encoding: [0xc4,0xe3,0xf9,0x69,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = call <2 x double> @llvm.fma.v2f64(<2 x double> %a0, <2 x double> %a1, <2 x double> %a2)
  ret <2 x double> %1
}

define <8 x float> @test_x86_fma_vfmadd_ps_256(<8 x float> %a0, <8 x float> %a1, <8 x float> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfmadd_ps_256:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfmaddps %ymm2, %ymm1, %ymm0, %ymm0 # encoding: [0xc4,0xe3,0xfd,0x68,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = call <8 x float> @llvm.fma.v8f32(<8 x float> %a0, <8 x float> %a1, <8 x float> %a2)
  ret <8 x float> %1
}

define <4 x double> @test_x86_fma_vfmadd_pd_256(<4 x double> %a0, <4 x double> %a1, <4 x double> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfmadd_pd_256:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfmaddpd %ymm2, %ymm1, %ymm0, %ymm0 # encoding: [0xc4,0xe3,0xfd,0x69,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = call <4 x double> @llvm.fma.v4f64(<4 x double> %a0, <4 x double> %a1, <4 x double> %a2)
  ret <4 x double> %1
}

; VFMSUB
define <4 x float> @test_x86_fma_vfmsub_ps(<4 x float> %a0, <4 x float> %a1, <4 x float> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfmsub_ps:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfmsubps %xmm2, %xmm1, %xmm0, %xmm0 # encoding: [0xc4,0xe3,0xf9,0x6c,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %a2
  %2 = call <4 x float> @llvm.fma.v4f32(<4 x float> %a0, <4 x float> %a1, <4 x float> %1)
  ret <4 x float> %2
}

define <4 x float> @test_x86_fma_vfmsub_ps_unary_fneg(<4 x float> %a0, <4 x float> %a1, <4 x float> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfmsub_ps_unary_fneg:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfmsubps %xmm2, %xmm1, %xmm0, %xmm0 # encoding: [0xc4,0xe3,0xf9,0x6c,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = fneg <4 x float> %a2
  %2 = call <4 x float> @llvm.fma.v4f32(<4 x float> %a0, <4 x float> %a1, <4 x float> %1)
  ret <4 x float> %2
}

define <2 x double> @test_x86_fma_vfmsub_pd(<2 x double> %a0, <2 x double> %a1, <2 x double> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfmsub_pd:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfmsubpd %xmm2, %xmm1, %xmm0, %xmm0 # encoding: [0xc4,0xe3,0xf9,0x6d,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = fsub <2 x double> <double -0.000000e+00, double -0.000000e+00>, %a2
  %2 = call <2 x double> @llvm.fma.v2f64(<2 x double> %a0, <2 x double> %a1, <2 x double> %1)
  ret <2 x double> %2
}

define <2 x double> @test_x86_fma_vfmsub_pd_unary_fneg(<2 x double> %a0, <2 x double> %a1, <2 x double> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfmsub_pd_unary_fneg:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfmsubpd %xmm2, %xmm1, %xmm0, %xmm0 # encoding: [0xc4,0xe3,0xf9,0x6d,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = fneg <2 x double> %a2
  %2 = call <2 x double> @llvm.fma.v2f64(<2 x double> %a0, <2 x double> %a1, <2 x double> %1)
  ret <2 x double> %2
}

define <8 x float> @test_x86_fma_vfmsub_ps_256(<8 x float> %a0, <8 x float> %a1, <8 x float> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfmsub_ps_256:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfmsubps %ymm2, %ymm1, %ymm0, %ymm0 # encoding: [0xc4,0xe3,0xfd,0x6c,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = fsub <8 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %a2
  %2 = call <8 x float> @llvm.fma.v8f32(<8 x float> %a0, <8 x float> %a1, <8 x float> %1)
  ret <8 x float> %2
}

define <8 x float> @test_x86_fma_vfmsub_ps_256_unary_fneg(<8 x float> %a0, <8 x float> %a1, <8 x float> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfmsub_ps_256_unary_fneg:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfmsubps %ymm2, %ymm1, %ymm0, %ymm0 # encoding: [0xc4,0xe3,0xfd,0x6c,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = fneg <8 x float> %a2
  %2 = call <8 x float> @llvm.fma.v8f32(<8 x float> %a0, <8 x float> %a1, <8 x float> %1)
  ret <8 x float> %2
}

define <4 x double> @test_x86_fma_vfmsub_pd_256(<4 x double> %a0, <4 x double> %a1, <4 x double> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfmsub_pd_256:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfmsubpd %ymm2, %ymm1, %ymm0, %ymm0 # encoding: [0xc4,0xe3,0xfd,0x6d,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = fsub <4 x double> <double -0.000000e+00, double -0.000000e+00, double -0.000000e+00, double -0.000000e+00>, %a2
  %2 = call <4 x double> @llvm.fma.v4f64(<4 x double> %a0, <4 x double> %a1, <4 x double> %1)
  ret <4 x double> %2
}

define <4 x double> @test_x86_fma_vfmsub_pd_256_unary_fneg(<4 x double> %a0, <4 x double> %a1, <4 x double> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfmsub_pd_256_unary_fneg:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfmsubpd %ymm2, %ymm1, %ymm0, %ymm0 # encoding: [0xc4,0xe3,0xfd,0x6d,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = fneg <4 x double> %a2
  %2 = call <4 x double> @llvm.fma.v4f64(<4 x double> %a0, <4 x double> %a1, <4 x double> %1)
  ret <4 x double> %2
}

; VFNMADD
define <4 x float> @test_x86_fma_vfnmadd_ps(<4 x float> %a0, <4 x float> %a1, <4 x float> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfnmadd_ps:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfnmaddps %xmm2, %xmm1, %xmm0, %xmm0 # encoding: [0xc4,0xe3,0xf9,0x78,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %a0
  %2 = call <4 x float> @llvm.fma.v4f32(<4 x float> %1, <4 x float> %a1, <4 x float> %a2)
  ret <4 x float> %2
}

define <4 x float> @test_x86_fma_vfnmadd_ps_unary_fneg(<4 x float> %a0, <4 x float> %a1, <4 x float> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfnmadd_ps_unary_fneg:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfnmaddps %xmm2, %xmm1, %xmm0, %xmm0 # encoding: [0xc4,0xe3,0xf9,0x78,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = fneg <4 x float> %a0
  %2 = call <4 x float> @llvm.fma.v4f32(<4 x float> %1, <4 x float> %a1, <4 x float> %a2)
  ret <4 x float> %2
}

define <2 x double> @test_x86_fma_vfnmadd_pd(<2 x double> %a0, <2 x double> %a1, <2 x double> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfnmadd_pd:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfnmaddpd %xmm2, %xmm1, %xmm0, %xmm0 # encoding: [0xc4,0xe3,0xf9,0x79,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = fsub <2 x double> <double -0.000000e+00, double -0.000000e+00>, %a0
  %2 = call <2 x double> @llvm.fma.v2f64(<2 x double> %1, <2 x double> %a1, <2 x double> %a2)
  ret <2 x double> %2
}

define <2 x double> @test_x86_fma_vfnmadd_pd_unary_fneg(<2 x double> %a0, <2 x double> %a1, <2 x double> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfnmadd_pd_unary_fneg:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfnmaddpd %xmm2, %xmm1, %xmm0, %xmm0 # encoding: [0xc4,0xe3,0xf9,0x79,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = fneg <2 x double> %a0
  %2 = call <2 x double> @llvm.fma.v2f64(<2 x double> %1, <2 x double> %a1, <2 x double> %a2)
  ret <2 x double> %2
}

define <8 x float> @test_x86_fma_vfnmadd_ps_256(<8 x float> %a0, <8 x float> %a1, <8 x float> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfnmadd_ps_256:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfnmaddps %ymm2, %ymm1, %ymm0, %ymm0 # encoding: [0xc4,0xe3,0xfd,0x78,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = fsub <8 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %a0
  %2 = call <8 x float> @llvm.fma.v8f32(<8 x float> %1, <8 x float> %a1, <8 x float> %a2)
  ret <8 x float> %2
}

define <8 x float> @test_x86_fma_vfnmadd_ps_256_unary_fneg(<8 x float> %a0, <8 x float> %a1, <8 x float> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfnmadd_ps_256_unary_fneg:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfnmaddps %ymm2, %ymm1, %ymm0, %ymm0 # encoding: [0xc4,0xe3,0xfd,0x78,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = fneg <8 x float> %a0
  %2 = call <8 x float> @llvm.fma.v8f32(<8 x float> %1, <8 x float> %a1, <8 x float> %a2)
  ret <8 x float> %2
}

define <4 x double> @test_x86_fma_vfnmadd_pd_256(<4 x double> %a0, <4 x double> %a1, <4 x double> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfnmadd_pd_256:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfnmaddpd %ymm2, %ymm1, %ymm0, %ymm0 # encoding: [0xc4,0xe3,0xfd,0x79,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = fsub <4 x double> <double -0.000000e+00, double -0.000000e+00, double -0.000000e+00, double -0.000000e+00>, %a0
  %2 = call <4 x double> @llvm.fma.v4f64(<4 x double> %1, <4 x double> %a1, <4 x double> %a2)
  ret <4 x double> %2
}

define <4 x double> @test_x86_fma_vfnmadd_pd_256_unary_fneg(<4 x double> %a0, <4 x double> %a1, <4 x double> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfnmadd_pd_256_unary_fneg:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfnmaddpd %ymm2, %ymm1, %ymm0, %ymm0 # encoding: [0xc4,0xe3,0xfd,0x79,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = fneg <4 x double> %a0
  %2 = call <4 x double> @llvm.fma.v4f64(<4 x double> %1, <4 x double> %a1, <4 x double> %a2)
  ret <4 x double> %2
}

; VFNMSUB
define <4 x float> @test_x86_fma_vfnmsub_ps(<4 x float> %a0, <4 x float> %a1, <4 x float> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfnmsub_ps:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfnmsubps %xmm2, %xmm1, %xmm0, %xmm0 # encoding: [0xc4,0xe3,0xf9,0x7c,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %a0
  %2 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %a2
  %3 = call <4 x float> @llvm.fma.v4f32(<4 x float> %1, <4 x float> %a1, <4 x float> %2)
  ret <4 x float> %3
}

define <4 x float> @test_x86_fma_vfnmsub_ps_unary_fneg(<4 x float> %a0, <4 x float> %a1, <4 x float> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfnmsub_ps_unary_fneg:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfnmsubps %xmm2, %xmm1, %xmm0, %xmm0 # encoding: [0xc4,0xe3,0xf9,0x7c,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = fneg <4 x float> %a0
  %2 = fneg <4 x float> %a2
  %3 = call <4 x float> @llvm.fma.v4f32(<4 x float> %1, <4 x float> %a1, <4 x float> %2)
  ret <4 x float> %3
}

define <2 x double> @test_x86_fma_vfnmsub_pd(<2 x double> %a0, <2 x double> %a1, <2 x double> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfnmsub_pd:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfnmsubpd %xmm2, %xmm1, %xmm0, %xmm0 # encoding: [0xc4,0xe3,0xf9,0x7d,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = fsub <2 x double> <double -0.000000e+00, double -0.000000e+00>, %a0
  %2 = fsub <2 x double> <double -0.000000e+00, double -0.000000e+00>, %a2
  %3 = call <2 x double> @llvm.fma.v2f64(<2 x double> %1, <2 x double> %a1, <2 x double> %2)
  ret <2 x double> %3
}

define <2 x double> @test_x86_fma_vfnmsub_pd_unary_fneg(<2 x double> %a0, <2 x double> %a1, <2 x double> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfnmsub_pd_unary_fneg:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfnmsubpd %xmm2, %xmm1, %xmm0, %xmm0 # encoding: [0xc4,0xe3,0xf9,0x7d,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = fneg <2 x double> %a0
  %2 = fneg <2 x double> %a2
  %3 = call <2 x double> @llvm.fma.v2f64(<2 x double> %1, <2 x double> %a1, <2 x double> %2)
  ret <2 x double> %3
}

define <8 x float> @test_x86_fma_vfnmsub_ps_256(<8 x float> %a0, <8 x float> %a1, <8 x float> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfnmsub_ps_256:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfnmsubps %ymm2, %ymm1, %ymm0, %ymm0 # encoding: [0xc4,0xe3,0xfd,0x7c,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = fsub <8 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %a0
  %2 = fsub <8 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %a2
  %3 = call <8 x float> @llvm.fma.v8f32(<8 x float> %1, <8 x float> %a1, <8 x float> %2)
  ret <8 x float> %3
}

define <8 x float> @test_x86_fma_vfnmsub_ps_256_unary_fneg(<8 x float> %a0, <8 x float> %a1, <8 x float> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfnmsub_ps_256_unary_fneg:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfnmsubps %ymm2, %ymm1, %ymm0, %ymm0 # encoding: [0xc4,0xe3,0xfd,0x7c,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = fneg <8 x float> %a0
  %2 = fneg <8 x float> %a2
  %3 = call <8 x float> @llvm.fma.v8f32(<8 x float> %1, <8 x float> %a1, <8 x float> %2)
  ret <8 x float> %3
}

define <4 x double> @test_x86_fma_vfnmsub_pd_256(<4 x double> %a0, <4 x double> %a1, <4 x double> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfnmsub_pd_256:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfnmsubpd %ymm2, %ymm1, %ymm0, %ymm0 # encoding: [0xc4,0xe3,0xfd,0x7d,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = fsub <4 x double> <double -0.000000e+00, double -0.000000e+00, double -0.000000e+00, double -0.000000e+00>, %a0
  %2 = fsub <4 x double> <double -0.000000e+00, double -0.000000e+00, double -0.000000e+00, double -0.000000e+00>, %a2
  %3 = call <4 x double> @llvm.fma.v4f64(<4 x double> %1, <4 x double> %a1, <4 x double> %2)
  ret <4 x double> %3
}

define <4 x double> @test_x86_fma_vfnmsub_pd_256_unary_fneg(<4 x double> %a0, <4 x double> %a1, <4 x double> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfnmsub_pd_256_unary_fneg:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfnmsubpd %ymm2, %ymm1, %ymm0, %ymm0 # encoding: [0xc4,0xe3,0xfd,0x7d,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = fneg <4 x double> %a0
  %2 = fneg <4 x double> %a2
  %3 = call <4 x double> @llvm.fma.v4f64(<4 x double> %1, <4 x double> %a1, <4 x double> %2)
  ret <4 x double> %3
}

; VFMADDSUB
define <4 x float> @test_x86_fma_vfmaddsub_ps(<4 x float> %a0, <4 x float> %a1, <4 x float> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfmaddsub_ps:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfmaddsubps %xmm2, %xmm1, %xmm0, %xmm0 # encoding: [0xc4,0xe3,0xf9,0x5c,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = call <4 x float> @llvm.fma.v4f32(<4 x float> %a0, <4 x float> %a1, <4 x float> %a2)
  %2 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %a2
  %3 = call <4 x float> @llvm.fma.v4f32(<4 x float> %a0, <4 x float> %a1, <4 x float> %2)
  %4 = shufflevector <4 x float> %3, <4 x float> %1, <4 x i32> <i32 0, i32 5, i32 2, i32 7>
  ret <4 x float> %4
}

define <4 x float> @test_x86_fma_vfmaddsub_ps_unary_fneg(<4 x float> %a0, <4 x float> %a1, <4 x float> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfmaddsub_ps_unary_fneg:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfmaddsubps %xmm2, %xmm1, %xmm0, %xmm0 # encoding: [0xc4,0xe3,0xf9,0x5c,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = call <4 x float> @llvm.fma.v4f32(<4 x float> %a0, <4 x float> %a1, <4 x float> %a2)
  %2 = fneg <4 x float> %a2
  %3 = call <4 x float> @llvm.fma.v4f32(<4 x float> %a0, <4 x float> %a1, <4 x float> %2)
  %4 = shufflevector <4 x float> %3, <4 x float> %1, <4 x i32> <i32 0, i32 5, i32 2, i32 7>
  ret <4 x float> %4
}

define <2 x double> @test_x86_fma_vfmaddsub_pd(<2 x double> %a0, <2 x double> %a1, <2 x double> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfmaddsub_pd:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfmaddsubpd %xmm2, %xmm1, %xmm0, %xmm0 # encoding: [0xc4,0xe3,0xf9,0x5d,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = call <2 x double> @llvm.fma.v2f64(<2 x double> %a0, <2 x double> %a1, <2 x double> %a2)
  %2 = fsub <2 x double> <double -0.000000e+00, double -0.000000e+00>, %a2
  %3 = call <2 x double> @llvm.fma.v2f64(<2 x double> %a0, <2 x double> %a1, <2 x double> %2)
  %4 = shufflevector <2 x double> %3, <2 x double> %1, <2 x i32> <i32 0, i32 3>
  ret <2 x double> %4
}

define <2 x double> @test_x86_fma_vfmaddsub_pd_unary_fneg(<2 x double> %a0, <2 x double> %a1, <2 x double> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfmaddsub_pd_unary_fneg:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfmaddsubpd %xmm2, %xmm1, %xmm0, %xmm0 # encoding: [0xc4,0xe3,0xf9,0x5d,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = call <2 x double> @llvm.fma.v2f64(<2 x double> %a0, <2 x double> %a1, <2 x double> %a2)
  %2 = fneg <2 x double> %a2
  %3 = call <2 x double> @llvm.fma.v2f64(<2 x double> %a0, <2 x double> %a1, <2 x double> %2)
  %4 = shufflevector <2 x double> %3, <2 x double> %1, <2 x i32> <i32 0, i32 3>
  ret <2 x double> %4
}

define <8 x float> @test_x86_fma_vfmaddsub_ps_256(<8 x float> %a0, <8 x float> %a1, <8 x float> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfmaddsub_ps_256:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfmaddsubps %ymm2, %ymm1, %ymm0, %ymm0 # encoding: [0xc4,0xe3,0xfd,0x5c,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = call <8 x float> @llvm.fma.v8f32(<8 x float> %a0, <8 x float> %a1, <8 x float> %a2)
  %2 = fsub <8 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %a2
  %3 = call <8 x float> @llvm.fma.v8f32(<8 x float> %a0, <8 x float> %a1, <8 x float> %2)
  %4 = shufflevector <8 x float> %3, <8 x float> %1, <8 x i32> <i32 0, i32 9, i32 2, i32 11, i32 4, i32 13, i32 6, i32 15>
  ret <8 x float> %4
}

define <8 x float> @test_x86_fma_vfmaddsub_ps_256_unary_fneg(<8 x float> %a0, <8 x float> %a1, <8 x float> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfmaddsub_ps_256_unary_fneg:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfmaddsubps %ymm2, %ymm1, %ymm0, %ymm0 # encoding: [0xc4,0xe3,0xfd,0x5c,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = call <8 x float> @llvm.fma.v8f32(<8 x float> %a0, <8 x float> %a1, <8 x float> %a2)
  %2 = fneg <8 x float> %a2
  %3 = call <8 x float> @llvm.fma.v8f32(<8 x float> %a0, <8 x float> %a1, <8 x float> %2)
  %4 = shufflevector <8 x float> %3, <8 x float> %1, <8 x i32> <i32 0, i32 9, i32 2, i32 11, i32 4, i32 13, i32 6, i32 15>
  ret <8 x float> %4
}

define <4 x double> @test_x86_fma_vfmaddsub_pd_256(<4 x double> %a0, <4 x double> %a1, <4 x double> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfmaddsub_pd_256:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfmaddsubpd %ymm2, %ymm1, %ymm0, %ymm0 # encoding: [0xc4,0xe3,0xfd,0x5d,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = call <4 x double> @llvm.fma.v4f64(<4 x double> %a0, <4 x double> %a1, <4 x double> %a2)
  %2 = fsub <4 x double> <double -0.000000e+00, double -0.000000e+00, double -0.000000e+00, double -0.000000e+00>, %a2
  %3 = call <4 x double> @llvm.fma.v4f64(<4 x double> %a0, <4 x double> %a1, <4 x double> %2)
  %4 = shufflevector <4 x double> %3, <4 x double> %1, <4 x i32> <i32 0, i32 5, i32 2, i32 7>
  ret <4 x double> %4
}

define <4 x double> @test_x86_fma_vfmaddsub_pd_256_unary_fneg(<4 x double> %a0, <4 x double> %a1, <4 x double> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfmaddsub_pd_256_unary_fneg:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfmaddsubpd %ymm2, %ymm1, %ymm0, %ymm0 # encoding: [0xc4,0xe3,0xfd,0x5d,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = call <4 x double> @llvm.fma.v4f64(<4 x double> %a0, <4 x double> %a1, <4 x double> %a2)
  %2 = fneg <4 x double> %a2
  %3 = call <4 x double> @llvm.fma.v4f64(<4 x double> %a0, <4 x double> %a1, <4 x double> %2)
  %4 = shufflevector <4 x double> %3, <4 x double> %1, <4 x i32> <i32 0, i32 5, i32 2, i32 7>
  ret <4 x double> %4
}

; VFMSUBADD
define <4 x float> @test_x86_fma_vfmsubadd_ps(<4 x float> %a0, <4 x float> %a1, <4 x float> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfmsubadd_ps:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfmsubaddps %xmm2, %xmm1, %xmm0, %xmm0 # encoding: [0xc4,0xe3,0xf9,0x5e,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = call <4 x float> @llvm.fma.v4f32(<4 x float> %a0, <4 x float> %a1, <4 x float> %a2)
  %2 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %a2
  %3 = call <4 x float> @llvm.fma.v4f32(<4 x float> %a0, <4 x float> %a1, <4 x float> %2)
  %4 = shufflevector <4 x float> %1, <4 x float> %3, <4 x i32> <i32 0, i32 5, i32 2, i32 7>
  ret <4 x float> %4
}

define <4 x float> @test_x86_fma_vfmsubadd_ps_unary_fneg(<4 x float> %a0, <4 x float> %a1, <4 x float> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfmsubadd_ps_unary_fneg:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfmsubaddps %xmm2, %xmm1, %xmm0, %xmm0 # encoding: [0xc4,0xe3,0xf9,0x5e,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = call <4 x float> @llvm.fma.v4f32(<4 x float> %a0, <4 x float> %a1, <4 x float> %a2)
  %2 = fneg <4 x float> %a2
  %3 = call <4 x float> @llvm.fma.v4f32(<4 x float> %a0, <4 x float> %a1, <4 x float> %2)
  %4 = shufflevector <4 x float> %1, <4 x float> %3, <4 x i32> <i32 0, i32 5, i32 2, i32 7>
  ret <4 x float> %4
}

define <2 x double> @test_x86_fma_vfmsubadd_pd(<2 x double> %a0, <2 x double> %a1, <2 x double> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfmsubadd_pd:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfmsubaddpd %xmm2, %xmm1, %xmm0, %xmm0 # encoding: [0xc4,0xe3,0xf9,0x5f,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = call <2 x double> @llvm.fma.v2f64(<2 x double> %a0, <2 x double> %a1, <2 x double> %a2)
  %2 = fsub <2 x double> <double -0.000000e+00, double -0.000000e+00>, %a2
  %3 = call <2 x double> @llvm.fma.v2f64(<2 x double> %a0, <2 x double> %a1, <2 x double> %2)
  %4 = shufflevector <2 x double> %1, <2 x double> %3, <2 x i32> <i32 0, i32 3>
  ret <2 x double> %4
}

define <2 x double> @test_x86_fma_vfmsubadd_pd_unary_fneg(<2 x double> %a0, <2 x double> %a1, <2 x double> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfmsubadd_pd_unary_fneg:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfmsubaddpd %xmm2, %xmm1, %xmm0, %xmm0 # encoding: [0xc4,0xe3,0xf9,0x5f,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = call <2 x double> @llvm.fma.v2f64(<2 x double> %a0, <2 x double> %a1, <2 x double> %a2)
  %2 = fneg <2 x double> %a2
  %3 = call <2 x double> @llvm.fma.v2f64(<2 x double> %a0, <2 x double> %a1, <2 x double> %2)
  %4 = shufflevector <2 x double> %1, <2 x double> %3, <2 x i32> <i32 0, i32 3>
  ret <2 x double> %4
}


define <8 x float> @test_x86_fma_vfmsubadd_ps_256(<8 x float> %a0, <8 x float> %a1, <8 x float> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfmsubadd_ps_256:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfmsubaddps %ymm2, %ymm1, %ymm0, %ymm0 # encoding: [0xc4,0xe3,0xfd,0x5e,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = call <8 x float> @llvm.fma.v8f32(<8 x float> %a0, <8 x float> %a1, <8 x float> %a2)
  %2 = fsub <8 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %a2
  %3 = call <8 x float> @llvm.fma.v8f32(<8 x float> %a0, <8 x float> %a1, <8 x float> %2)
  %4 = shufflevector <8 x float> %1, <8 x float> %3, <8 x i32> <i32 0, i32 9, i32 2, i32 11, i32 4, i32 13, i32 6, i32 15>
  ret <8 x float> %4
}

define <8 x float> @test_x86_fma_vfmsubadd_ps_256_unary_fneg(<8 x float> %a0, <8 x float> %a1, <8 x float> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfmsubadd_ps_256_unary_fneg:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfmsubaddps %ymm2, %ymm1, %ymm0, %ymm0 # encoding: [0xc4,0xe3,0xfd,0x5e,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = call <8 x float> @llvm.fma.v8f32(<8 x float> %a0, <8 x float> %a1, <8 x float> %a2)
  %2 = fneg <8 x float> %a2
  %3 = call <8 x float> @llvm.fma.v8f32(<8 x float> %a0, <8 x float> %a1, <8 x float> %2)
  %4 = shufflevector <8 x float> %1, <8 x float> %3, <8 x i32> <i32 0, i32 9, i32 2, i32 11, i32 4, i32 13, i32 6, i32 15>
  ret <8 x float> %4
}

define <4 x double> @test_x86_fma_vfmsubadd_pd_256(<4 x double> %a0, <4 x double> %a1, <4 x double> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfmsubadd_pd_256:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfmsubaddpd %ymm2, %ymm1, %ymm0, %ymm0 # encoding: [0xc4,0xe3,0xfd,0x5f,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = call <4 x double> @llvm.fma.v4f64(<4 x double> %a0, <4 x double> %a1, <4 x double> %a2)
  %2 = fsub <4 x double> <double -0.000000e+00, double -0.000000e+00, double -0.000000e+00, double -0.000000e+00>, %a2
  %3 = call <4 x double> @llvm.fma.v4f64(<4 x double> %a0, <4 x double> %a1, <4 x double> %2)
  %4 = shufflevector <4 x double> %1, <4 x double> %3, <4 x i32> <i32 0, i32 5, i32 2, i32 7>
  ret <4 x double> %4
}

define <4 x double> @test_x86_fma_vfmsubadd_pd_256_unary_fneg(<4 x double> %a0, <4 x double> %a1, <4 x double> %a2) #0 {
; CHECK-LABEL: test_x86_fma_vfmsubadd_pd_256_unary_fneg:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfmsubaddpd %ymm2, %ymm1, %ymm0, %ymm0 # encoding: [0xc4,0xe3,0xfd,0x5f,0xc2,0x10]
; CHECK-NEXT:    retq # encoding: [0xc3]
  %1 = call <4 x double> @llvm.fma.v4f64(<4 x double> %a0, <4 x double> %a1, <4 x double> %a2)
  %2 = fneg <4 x double> %a2
  %3 = call <4 x double> @llvm.fma.v4f64(<4 x double> %a0, <4 x double> %a1, <4 x double> %2)
  %4 = shufflevector <4 x double> %1, <4 x double> %3, <4 x i32> <i32 0, i32 5, i32 2, i32 7>
  ret <4 x double> %4
}

declare <4 x float> @llvm.fma.v4f32(<4 x float>, <4 x float>, <4 x float>) #2
declare <2 x double> @llvm.fma.v2f64(<2 x double>, <2 x double>, <2 x double>) #2
declare <8 x float> @llvm.fma.v8f32(<8 x float>, <8 x float>, <8 x float>) #2
declare <4 x double> @llvm.fma.v4f64(<4 x double>, <4 x double>, <4 x double>) #2

attributes #0 = { nounwind }

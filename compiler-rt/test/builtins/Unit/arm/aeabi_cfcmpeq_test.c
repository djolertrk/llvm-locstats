// REQUIRES-ANY: arm-target-arch,armv6m-target-arch
// RUN: %arm_call_apsr -o %t.aspr.o
// RUN: %clang_builtins %s  %t.aspr.o %librt -o %t && %run %t
//===-- aeabi_cfcmpeq.c - Test __aeabi_cfcmpeq ----------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file tests __aeabi_cfcmpeq for the compiler_rt library.
//
//===----------------------------------------------------------------------===//

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#if __arm__
#include "call_apsr.h"

extern __attribute__((pcs("aapcs"))) void __aeabi_cfcmpeq(float a, float b);

int test__aeabi_cfcmpeq(float a, float b, int expected)
{
    uint32_t cpsr_value = call_apsr_f(a, b, __aeabi_cfcmpeq);
    union cpsr cpsr = { .value = cpsr_value };
    if (expected != cpsr.flags.z) {
        printf("error in __aeabi_cfcmpeq(%f, %f) => Z = %d, expected %d\n",
               a, b, cpsr.flags.z, expected);
        return 1;
    }
    return 0;
}
#endif

int main()
{
#if __arm__
    if (test__aeabi_cfcmpeq(1.0, 1.0, 1))
        return 1;
    if (test__aeabi_cfcmpeq(1234.567, 765.4321, 0))
        return 1;
    if (test__aeabi_cfcmpeq(-123.0, -678.0, 0))
        return 1;
    if (test__aeabi_cfcmpeq(0.0, -0.0, 1))
        return 1;
    if (test__aeabi_cfcmpeq(1.0, NAN, 0))
        return 1;
    if (test__aeabi_cfcmpeq(NAN, 1.0, 0))
        return 1;
    if (test__aeabi_cfcmpeq(NAN, NAN, 0))
        return 1;
    if (test__aeabi_cfcmpeq(INFINITY, 1.0, 0))
        return 1;
    if (test__aeabi_cfcmpeq(0.0, INFINITY, 0))
        return 1;
    if (test__aeabi_cfcmpeq(-INFINITY, 0.0, 0))
        return 1;
    if (test__aeabi_cfcmpeq(0.0, -INFINITY, 0))
        return 1;
    if (test__aeabi_cfcmpeq(INFINITY, INFINITY, 1))
        return 1;
    if (test__aeabi_cfcmpeq(-INFINITY, -INFINITY, 1))
        return 1;
#else
    printf("skipped\n");
#endif
    return 0;
}

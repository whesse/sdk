// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

#ifndef RUNTIME_VM_STACK_FRAME_X64_H_
#define RUNTIME_VM_STACK_FRAME_X64_H_

#if !defined(RUNTIME_VM_STACK_FRAME_H_)
#error Do not include stack_frame_x64.h directly; use stack_frame.h instead.
#endif

#include "vm/constants.h"

namespace dart {

/* X64 Dart Frame Layout

               |                    | <- TOS
Callee frame   | ...                |
               | saved PP           |
               | code object        |
               | saved RBP          |    (RBP of current frame)
               | saved PC           |    (PC of current frame)
               +--------------------+
Current frame  | ...               T| <- RSP of current frame
               | first local       T|
               | caller's PP       T|
               | code object       T|    (current frame's code object)
               | caller's RBP       | <- RBP of current frame
               | caller's ret addr  |    (PC of caller frame)
               +--------------------+
Caller frame   | last parameter     | <- RSP of caller frame
               |  ...               |

               T against a slot indicates it needs to be traversed during GC.
*/

static constexpr int kDartFrameFixedSize = 4;  // PC marker, RBP, PP, PC.
static constexpr int kSavedPcSlotFromSp = -1;

static constexpr int kFirstObjectSlotFromFp =
    -1;  // Used by GC to traverse stack.
static constexpr int kLastFixedObjectSlotFromFp = -2;

static constexpr int kFirstLocalSlotFromFp = -3;
static constexpr int kSavedCallerPpSlotFromFp = -2;
static constexpr int kPcMarkerSlotFromFp = -1;
static constexpr int kSavedCallerFpSlotFromFp = 0;
static constexpr int kSavedCallerPcSlotFromFp = 1;

static constexpr int kParamEndSlotFromFp = 1;  // One slot past last parameter.
static constexpr int kCallerSpSlotFromFp = 2;
static constexpr int kLastParamSlotFromEntrySp = 1;  // Skip return address.

// Entry and exit frame layout.
#if defined(DART_TARGET_OS_WINDOWS)
static constexpr int kExitLinkSlotFromEntryFp = -33;
#else
static constexpr int kExitLinkSlotFromEntryFp = -11;
#endif  // defined(DART_TARGET_OS_WINDOWS)

// For FFI native -> Dart callbacks, the number of stack slots between arguments
// passed on stack and arguments saved in callback prologue. 2 = return address
// (1) + saved frame pointer (1). Also add slots for the shadow space, if
// present.
//
// If NativeCallbackTrampolines::Enabled(), then
// kNativeCallbackTrampolineStackDelta must be added as well.
constexpr intptr_t kCallbackSlotsBeforeSavedArguments =
    2 + CallingConventions::kShadowSpaceBytes / kWordSize;

// For FFI calls passing in TypedData, we save it on the stack before entering
// a Dart frame. This denotes how to get to the backed up typed data.
static constexpr int kFfiCallerTypedDataSlotFromFp = kCallerSpSlotFromFp;

}  // namespace dart

#endif  // RUNTIME_VM_STACK_FRAME_X64_H_

// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

class I<X, Y> {}

mixin M0<T> implements I<T, List<T>> {}

mixin M1<T> implements I<List<T>, T> {}

//////////////////////////////////////////////////////
// Inference does not produce infinite types
///////////////////////////////////////////////////////

// No solution, even with unification, since solution
// requires that I<List<U0>, U0> == I<U1, List<U1>>
// for some U0, U1, and hence that:
// U0 = List<U1>
// U1 = List<U0>
// which has no finite solution
class A with M0, M1 {}
//    ^
// [analyzer] COMPILE_TIME_ERROR.CONFLICTING_GENERIC_INTERFACES
// [cfe] 'Object with M0, M1' can't implement both 'I<dynamic, List<dynamic>>' and 'I<List<dynamic>, dynamic>'

void main() {}

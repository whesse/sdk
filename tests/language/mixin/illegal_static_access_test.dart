// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import "package:expect/expect.dart";

class S {
  static foo() => 42;
}

mixin M {
  static bar() => 87;
}

class C = S with M;

main() {
  Expect.equals(42, S.foo());
  Expect.equals(87, M.bar());

  Expect.throwsNoSuchMethodError(() => C.foo());
  //                                     ^^^
  // [analyzer] COMPILE_TIME_ERROR.UNDEFINED_METHOD
  // [cfe] Member not found: 'C.foo'.
  Expect.throwsNoSuchMethodError(() => C.bar());
  //                                     ^^^
  // [analyzer] COMPILE_TIME_ERROR.UNDEFINED_METHOD
  // [cfe] Member not found: 'C.bar'.
}

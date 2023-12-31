// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// TODO(https://github.com/dart-lang/sdk/issues/51557): Decide if the mixins
// being applied in this test should be "mixin", "mixin class" or the test
// should be left at 2.19.
// @dart=2.19

import "package:expect/expect.dart";

// Tests codegen of methods reached only via interface implemented by mixin
// application.

class JSIB {}

class TD {}

class M {
  foo() => 123;
}

class I8 extends TD with M implements JSIB {}

use(x) {
  if (x is JSIB) {
    // Should be able to find M.foo since I8 is a subtype of both JSIB and M.
    Expect.equals(123, (x as dynamic).foo());
  }
}

main() {
  (use)(new I8());
}

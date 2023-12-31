// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart=2.19

// Regression test for issue 11891.

import "package:expect/expect.dart";
import "prefix_lib.dart";

class A extends Object with MixinClass {
  String baz() => bar();
}

void main() {
  var a = new A();
  Expect.equals('{"a":1}', a.baz());
}

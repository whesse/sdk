// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// TODO(https://github.com/dart-lang/sdk/issues/51557): Decide if the mixins
// being applied in this test should be "mixin", "mixin class" or the test
// should be left at 2.19.
// @dart=2.19

import "package:expect/expect.dart";
import "inheritance_constraints_lib.dart" deferred as lib;

class Foo {}

class Foo2 extends D {}

class A extends lib.Foo {}
//              ^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.SUBTYPE_OF_DEFERRED_CLASS

class B implements lib.Foo {}
//                 ^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.SUBTYPE_OF_DEFERRED_CLASS

class C1 {}

class C = C1 with lib.Foo;
//                ^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.SUBTYPE_OF_DEFERRED_CLASS

class D {
  D();
  factory D.factory() = lib.Foo2;
//                      ^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.REDIRECT_TO_INVALID_RETURN_TYPE
// [cfe] The constructor function type 'Foo2 Function()' isn't a subtype of 'D Function()'.
}

void main() {
  new A();
  new B();
  new C();
  new D.factory();
}

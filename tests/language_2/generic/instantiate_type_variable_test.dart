// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

// Test that you cannot instantiate a type variable.

class Foo<T> {
  Foo() {}
  T make() {
    return new T();
    //         ^
    // [analyzer] COMPILE_TIME_ERROR.CREATION_WITH_NON_TYPE
    // [cfe] Couldn't find constructor 'T'.
  }
}

main() {
  new Foo<Object>().make();
}

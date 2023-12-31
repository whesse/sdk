// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart=2.19

// Regression test for named mixin applications with implements clause.

class A {}

class S {}

class M {}

class C = S with M implements A;

void main() {
  new C();
}

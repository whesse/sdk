// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart=2.19

library mixin_lib_extends_field_lib;

mixin M1 {
  final bar = "M1-bar";
}

mixin M2 {
  var baz = "M2-$_baz";
}

var _baz = "baz";

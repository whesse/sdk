// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

// Regression test for dartbug.com/38965.

int a = -1;

main() {
  false ? (-0.0 as int) : (++a);
}

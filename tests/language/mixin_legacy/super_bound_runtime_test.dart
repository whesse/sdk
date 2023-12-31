// TODO(multitest): This was automatically migrated from a multitest and may
// contain strange or dead code.

// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart=2.19

class M<U extends V, V> {}

class N<U, V extends U> {}

class S<T> {}

class MNA<U, V extends U, W> extends S<List<U>>
    with M<V, U>, N<List<W>, List<W>> {}

class MNA2<U, V extends U, W> = S<List<U>> with M<V, U>, N<List<W>, List<W>>;

main() {
  new MNA<num, int, bool>();
  new MNA2<num, int, bool>();

  // Type parameter U of M must extend type parameter V, but
  // type argument num is not a subtype of int.

  // Type parameter U of M must extend type parameter V, but
  // type argument num is not a subtype of int.
}

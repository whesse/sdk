// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// The identifiers listed below are mentioned in the grammar, but none of
// them is a reserved word or a built-in identifier. Such an identifier can
// be used just like all other identifiers, with the exceptions mentioned
// below. Here are said 'known' identifiers:
//
//   `async`, `await`, `hide`, `of`, `on`, `show`, `sync`, `yield`
//
// The following exceptions apply:
//
//   It is a compile-time error to use `await` or `yield` as an identifier in
//   the body of a function marked `async`, `async*`, or `sync*`.
//
//   It is a compile-time error if an asynchronous for-in appears inside a
//   synchronous function.

import 'dart:async';

Future<void> f1() async {
  // Allowed:
  int async = 1;
  int await = 1;
  //  ^^^^^
  // [analyzer] SYNTACTIC_ERROR.ASYNC_KEYWORD_USED_AS_IDENTIFIER
  // [cfe] 'await' can't be used as an identifier in 'async', 'async*', or 'sync*' methods.
  int yield = 1;
  //  ^^^^^
  // [analyzer] SYNTACTIC_ERROR.ASYNC_KEYWORD_USED_AS_IDENTIFIER
  // [cfe] 'yield' can't be used as an identifier in 'async', 'async*', or 'sync*' methods.

  Stream<int> s = new Stream<int>.fromFuture(new Future<int>.value(1));
  await for (int i in s) {
    return;
  }
}

Stream<int> f2() async* {
  int async = 1;
  int await = 1;
  //  ^^^^^
  // [analyzer] SYNTACTIC_ERROR.ASYNC_KEYWORD_USED_AS_IDENTIFIER
  // [cfe] 'await' can't be used as an identifier in 'async', 'async*', or 'sync*' methods.
  int yield = 1;
  //  ^^^^^
  // [analyzer] SYNTACTIC_ERROR.ASYNC_KEYWORD_USED_AS_IDENTIFIER
  // [cfe] 'yield' can't be used as an identifier in 'async', 'async*', or 'sync*' methods.

  Stream<int> s = new Stream<int>.fromFuture(new Future<int>.value(1));
  await for (var i in s) {
    yield i + 1;
  }
}

Iterable<int> f3() sync* {
  int async = 1;
  int await = 1;
  //  ^^^^^
  // [analyzer] SYNTACTIC_ERROR.ASYNC_KEYWORD_USED_AS_IDENTIFIER
  // [cfe] 'await' can't be used as an identifier in 'async', 'async*', or 'sync*' methods.
  int yield = 1;
  //  ^^^^^
  // [analyzer] SYNTACTIC_ERROR.ASYNC_KEYWORD_USED_AS_IDENTIFIER
  // [cfe] 'yield' can't be used as an identifier in 'async', 'async*', or 'sync*' methods.

  Stream<int> s = new Stream<int>.fromFuture(new Future<int>.value(1));
  await for (int i in s) {
//^^^^^
// [analyzer] COMPILE_TIME_ERROR.ASYNC_FOR_IN_WRONG_CONTEXT
// [cfe] The asynchronous for-in can only be used in functions marked with 'async' or 'async*'.
    yield i + 1;
  }
}

void f4() {
  int async = 1;
  int await = 1;
  int yield = 1;

  Stream s = new Stream<int>.fromFuture(new Future<int>.value(1));
  await for (int i in s) {
//^^^^^
// [analyzer] COMPILE_TIME_ERROR.ASYNC_FOR_IN_WRONG_CONTEXT
// [cfe] The asynchronous for-in can only be used in functions marked with 'async' or 'async*'.
    return;
  }

}

main() {
  Future<void> f = f1();
  Stream s = f2();
  Iterable<int> i = f3();
  f4();
}

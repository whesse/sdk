// Copyright (c) 2018, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:analysis_server/src/services/correction/fix.dart';
import 'package:analyzer/src/error/codes.dart';
import 'package:analyzer_plugin/utilities/fixes/fixes.dart';
import 'package:test_reflective_loader/test_reflective_loader.dart';

import 'fix_processor.dart';

void main() {
  defineReflectiveSuite(() {
    defineReflectiveTests(RemoveUnnecessaryCastBulkTest);
    defineReflectiveTests(RemoveUnnecessaryCastMultiTest);
    defineReflectiveTests(RemoveUnnecessaryCastTest);
  });
}

@reflectiveTest
class RemoveUnnecessaryCastBulkTest extends BulkFixProcessorTest {
  Future<void> test_assignment() async {
    await resolveTestCode('''
void f(Object p) {
  if (p is String) {
    var v = (p as String) as String;
    print(v);
  }
}
''');
    await assertHasFix('''
void f(Object p) {
  if (p is String) {
    var v = p;
    print(v);
  }
}
''');
  }
}

@reflectiveTest
class RemoveUnnecessaryCastMultiTest extends FixProcessorTest {
  @override
  FixKind get kind => DartFixKind.REMOVE_UNNECESSARY_CAST_MULTI;

  Future<void> test_assignment_all() async {
    await resolveTestCode('''
void f(Object p, Object q) {
  if (p is String) {
    var v = (p as String) as String;
    print(v);
  }
  if (q is int) {
    int v = ((q as int));
    print(v);
  }
}
''');
    await assertHasFixAllFix(WarningCode.UNNECESSARY_CAST, '''
void f(Object p, Object q) {
  if (p is String) {
    var v = p;
    print(v);
  }
  if (q is int) {
    int v = q;
    print(v);
  }
}
''');
  }
}

@reflectiveTest
class RemoveUnnecessaryCastTest extends FixProcessorTest {
  @override
  FixKind get kind => DartFixKind.REMOVE_UNNECESSARY_CAST;

  Future<void> test_assignment() async {
    await resolveTestCode('''
void f(Object p) {
  if (p is String) {
    String v = ((p as String));
    print(v);
  }
}
''');
    await assertHasFix('''
void f(Object p) {
  if (p is String) {
    String v = p;
    print(v);
  }
}
''');
  }
}

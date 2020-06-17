// Copyright (c) 2018, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:analysis_server/src/services/correction/fix.dart';
import 'package:analysis_server/src/services/linter/lint_names.dart';
import 'package:analyzer/src/dart/analysis/experiments.dart';
import 'package:analyzer_plugin/utilities/fixes/fixes.dart';
import 'package:test_reflective_loader/test_reflective_loader.dart';

import 'fix_processor.dart';

void main() {
  defineReflectiveSuite(() {
    defineReflectiveTests(MakeFinalTest);
    defineReflectiveTests(MakeFinalWithNNBDTest);
  });
}

@reflectiveTest
class MakeFinalTest extends FixProcessorLintTest {
  @override
  FixKind get kind => DartFixKind.MAKE_FINAL;

  @override
  String get lintCode => LintNames.prefer_final_fields;

  Future<void> test_field_type() async {
    await resolveTestUnit('''
class C {
  int _f = 2;
  int get g => _f;
}
''');
    await assertHasFix('''
class C {
  final int _f = 2;
  int get g => _f;
}
''');
  }

  Future<void> test_field_var() async {
    await resolveTestUnit('''
class C {
  var _f = 2;
  int get g => _f;
}
''');
    await assertHasFix('''
class C {
  final _f = 2;
  int get g => _f;
}
''');
  }
}

@reflectiveTest
class MakeFinalWithNNBDTest extends FixProcessorLintTest {
  @override
  List<String> get experiments => [EnableString.non_nullable];

  @override
  FixKind get kind => DartFixKind.MAKE_FINAL;

  @override
  String get lintCode => LintNames.prefer_final_fields;

  Future<void> test_lateField_type() async {
    await resolveTestUnit('''
class C {
  late int _f = 2;
  int get g => _f;
}
''');
    await assertHasFix('''
class C {
  late final int _f = 2;
  int get g => _f;
}
''');
  }

  Future<void> test_lateField_var() async {
    await resolveTestUnit('''
class C {
  late var _f = 2;
  int get g => _f;
}
''');
    await assertHasFix('''
class C {
  late final _f = 2;
  int get g => _f;
}
''');
  }
}

// Copyright (c) 2018, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:test_reflective_loader/test_reflective_loader.dart';

import 'apply_options_test.dart' as apply_options;
import 'options_rule_validator_test.dart' as options_rule_validator;

main() {
  defineReflectiveSuite(() {
    apply_options.main();
    options_rule_validator.main();
  }, name: 'options');
}

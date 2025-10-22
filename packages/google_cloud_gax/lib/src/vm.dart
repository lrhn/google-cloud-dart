// Copyright 2025 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/// VM-specific implementations.
library;

import 'dart:io';

/// The Dart version to use in "x-goog-api-client" headers.
///
/// The format is either `major.minor.patch` or the special value `0`, which
/// indicates that the version is unknown.
final clientDartVersion = _clientDartVersion();

String _clientDartVersion() {
  const charDot = 0x2E, charZero = 0x30;  
  final text = Platform.version;
  for (var i = 0; i < text.length; i++) {
    final char = text.codeUnitAt(i);
    if (char ^ charZero > 9 && char != charDot) {
      return text.substring(0, i);
    }
  }
  return text;
}
    

/// The environment variable with the given name.
String? environmentVariable(String name) => Platform.environment[name];

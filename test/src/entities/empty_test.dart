// Copyright 2023 JotapeTecnologia

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//     http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:test/test.dart';
import 'package:micro_core_result/src/micro_core_result.dart';

void main() {
  group(
    'Empty |',
    () {
      test(
        'Should be always the same | Singleton',
        () {
          // Arrange
          const firstEmpty = empty;

          // Act
          const secondEmpty = empty;

          // Assert
          expect(firstEmpty, isA<Empty>());
          expect(secondEmpty, isA<Empty>());
          expect(firstEmpty.hashCode, firstEmpty.hashCode);
          expect(firstEmpty, firstEmpty);
        },
      );

      test(
        'Should be able to convert to [String] | toString()',
        () {
          // Arrange
          const string = '[]';

          // Act
          final result = empty.toString();

          // Assert
          expect(result, isA<String>());
          expect(result, string);
        },
      );
    },
  );
}

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
    'Left |',
    () {
      test(
        'Should be an extension of Result | Heritage',
        () {
          // Arrange
          const leftData = 'left';

          // Act
          final left = Left(leftData);

          // Assert
          expect(left, isA<Left>());
          expect(left, isA<Result>());
        },
      );

      test(
        'Should be a left | getter isLeft',
        () {
          // Arrange
          const leftData = 'left';

          // Act
          final left = Left(leftData);

          // Assert
          expect(left, isA<Left>());
          expect(left.isLeft, true);
        },
      );

      test(
        'Should not be a right | getter isRight',
        () {
          // Arrange
          const leftData = 'left';

          // Act
          final left = Left(leftData);

          // Assert
          expect(left, isA<Left>());
          expect(left.isRight, false);
        },
      );

      test(
        'Should have a value on left side | call()',
        () {
          // Arrange
          const leftData = 'left';

          // Act
          final left = Left(leftData);

          // Assert
          left(
            (leftSide) => expect(leftSide, leftData),
            (rightSide) => expect(true, false),
          );
        },
      );

      test(
        'Should return the left result object to other callable functions.',
        () {
          // Arrange
          const leftData = 'left';
          const newLeftDate = 'new left data';
          final left = Left<String, String>(leftData);

          // Act
          final Result result = left(
            (leftSide) => Left(newLeftDate),
            (rightSide) => Right(rightSide),
          );

          // Assert
          expect(result, isA<Left>());
          result(
            (leftSide) => expect(leftSide, equals(newLeftDate)),
            id,
          );
        },
      );
    },
  );

  group(
    'Right |',
    () {
      test(
        'Should be an extension of Result | Heritage',
        () {
          // Arrange
          const rightData = 'right';

          // Act
          final right = Right(rightData);

          // Assert
          expect(right, isA<Right>());
          expect(right, isA<Result>());
        },
      );

      test(
        'Should be a right | getter isRight',
        () {
          // Arrange
          const rightData = 'right';

          // Act
          final right = Right(rightData);

          // Assert
          expect(right, isA<Right>());
          expect(right.isRight, true);
        },
      );

      test(
        'Should not be a left | getter isLeft',
        () {
          // Arrange
          const rightData = 'right';

          // Act
          final right = Right(rightData);

          // Assert
          expect(right, isA<Right>());
          expect(right.isLeft, false);
        },
      );

      test(
        'Should have a value on right side | call()',
        () {
          // Arrange
          const rightData = 'right';

          // Act
          final right = Right(rightData);

          // Assert
          right(
            (lightSide) => expect(true, false),
            (rightSide) => expect(rightSide, rightData),
          );
        },
      );

      test(
        'Should return the right result object to other callable functions.',
        () {
          // Arrange
          const rightData = 'right';
          const newRightData = 'new right data';
          final right = Right<String, String>(rightData);

          // Act
          final Result result = right(
            (leftSide) => Left(leftSide),
            (rightSide) => Right(newRightData),
          );

          // Assert
          expect(result, isA<Right>());
          result(
            id,
            (rightSide) => expect(rightSide, equals(newRightData)),
          );
        },
      );
    },
  );

  group(
    'id |',
    () {
      test(
        'Should return the same value as any call() parameters',
        () {
          // Arrange
          const leftData = 'left';
          final left = Left(leftData);

          // Act
          final result = left(id, id);

          // Assert
          expect(result, isA<String>());
        },
      );
    },
  );
}

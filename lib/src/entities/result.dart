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

/// Interface of the [Left] and [Right] sides of the returned value.
abstract interface class Result<L, R> {
  void call(void Function(L l) left, void Function(R r) right);

  bool get isLeft;

  bool get isRight;
}

/// [Left] side of the returned value.
final class Left<L, R> extends Result<L, R> {
  final L l;

  Left(this.l);

  @override
  void call(void Function(L l) left, void Function(R r) right) => left(l);

  @override
  bool get isLeft => true;

  @override
  bool get isRight => false;
}

/// [Right] side of the returned value.
final class Right<L, R> extends Result<L, R> {
  final R r;

  Right(this.r);

  @override
  void call(void Function(L l) left, void Function(R r) right) => right(r);

  @override
  bool get isLeft => false;

  @override
  bool get isRight => true;
}

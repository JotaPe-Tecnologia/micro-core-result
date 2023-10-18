import 'dart:developer' show log;

import 'package:micro_core_result/micro_core_result.dart';

const names = ['Johnson', 'Harvey', 'Marshall', 'Denver', 'Noelene', 'Coreen'];

class Repository {
  Future<Result<Exception, Empty>> createName(String name) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      return Right(empty);
    } on Exception catch (exception) {
      return Left(exception);
    }
  }

  Future<Result<Exception, List<String>>> listNames() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      return Right(names);
    } on Exception catch (exception) {
      return Left(exception);
    }
  }
}

class Controller {
  final Repository _repository;

  final names = <String>[];

  Controller(this._repository);

  void createName(String name) async {
    final result = await _repository.createName(name);

    result(
      (exception) => log('Exception => ${exception.toString()}'),
      (_) => log('Name was created successfully!'),
    );
  }

  void listNames() async {
    final result = await _repository.listNames();

    result(
      (exception) => log('Exception => ${exception.toString()}'),
      (namesList) => names.addAll(namesList),
    );
  }
}

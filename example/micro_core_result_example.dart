import 'package:micro_core_result/micro_core_result.dart';

const names = ['Johnson', 'Harvey', 'Marshall', 'Denver', 'Noelene', 'Coreen'];

class Repository {
  Future<Result<Exception, Empty>> createName(String name) async {
    try {
      if (name.isEmpty) throw Exception('An empty name is invalid!');
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

  Future<Result<Exception, Empty>> createName(String name) async {
    final result = await _repository.createName(name);

    return result(
      (exception) {
        print('Exception => ${exception.toString()}');
        return Left(exception);
      },
      (e) {
        print('Name was created successfully!');
        return Right(e);
      },
    );
  }

  void listNames() async {
    final result = await _repository.listNames();

    result(
      (exception) => print('Exception => ${exception.toString()}'),
      (namesList) {
        print('Names before: $names');
        names.addAll(namesList);
        print('Names after: $names');
      },
    );
  }
}

void main() {
  final repository = Repository();
  final controller = Controller(repository);

  controller.createName('');

  controller.createName('Dave');

  controller.listNames();
}

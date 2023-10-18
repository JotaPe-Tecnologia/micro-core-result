A simple approach inspired on dartz package.

## Features

* Result, Left and Right classes to return more than 1 value
* Empty class to not return any data

## Usage

### Returning Left or Right

```dart
Future<Result<Exception, List<String>>> getNamesFromAPI() async {
    try {
        return Right(['Johnson', 'Harvey', 'Marshall', 'Denver', 'Noelene', 'Coreen']);
    } on Exception catch (exception) {
        return Left(exception);
    } 
}

void getNames() async {
    final result = await getNamesFromAPI();

    result(
        (exception) => print('Exception => ${exception.toString()}'); 
        (names) => print('Names => $names'); 
    );
}
```

### Returning Left or Empty

```dart
Future<Result<Exception, Empty>> createNameOnDatabase() async {
    try {
        return Right(empty);
    } on Exception catch (exception) {
        return Left(exception);
    } 
}

void createName() async {
    final result = await createNameOnDatabase();

    result(
        (exception) => print('Exception => ${exception.toString()}'); 
        (_) => print('Name Created'); 
    );
}
```
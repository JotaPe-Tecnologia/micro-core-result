micro_core_result
-----
![License](https://img.shields.io/github/license/JotaPe-Tecnologia/micro-core-result?logo=apache&logoColor=%23D22128&label=License&labelColor=%23FFFFFF&color=%23D22128)
![Package Version](https://img.shields.io/pub/v/micro_core_result?logo=dart&logoColor=%230175C2&label=Version&labelColor=%23FFFFFF&color=%230175C2)
![Package Points](https://img.shields.io/pub/points/micro_core_result?logo=dart&logoColor=%230175C2&label=Points&labelColor=%23FFFFFF&color=%230175C2)
![Coverage](https://img.shields.io/codecov/c/github/JotaPe-Tecnologia/micro-core-result?logo=codecov&logoColor=%23F01F7A&label=Coverage&labelColor=%23FFFFFF&color=%23F01F7A)
----

This package is a simple approach to return multiple values, inspired on dartz package.
----

## Platform Support

| Android | iOS | MacOS | Web | Linux | Windows |
| :-----: | :-: | :---: | :-: | :---: | :-----: |
|   ✅    | ✅  |  ✅   | ✅  |  ✅   |   ✅    |

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
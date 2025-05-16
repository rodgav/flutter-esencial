part of 'example_bloc.dart';

@immutable
abstract class ExampleState {
}

class ExampleInitial implements ExampleState {
  final int counter;

  ExampleInitial({required this.counter});
}

class ExampleNone implements ExampleState{}
part of 'example_cubit.dart';

@immutable
abstract class ExampleState {}

class ExampleInitial extends ExampleState {
  final int count;

  ExampleInitial({required this.count});
}

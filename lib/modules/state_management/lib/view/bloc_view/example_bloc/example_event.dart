part of 'example_bloc.dart';

@immutable
abstract class ExampleEvent {}

class IncrementEvent extends ExampleEvent {}

class DecrementEvent extends ExampleEvent {}

class ResetEvent extends ExampleEvent {}
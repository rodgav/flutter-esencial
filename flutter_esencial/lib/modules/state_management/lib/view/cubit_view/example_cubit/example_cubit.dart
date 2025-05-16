import 'package:flutter/material.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;

part 'example_state.dart';

class ExampleCubit extends Cubit<ExampleState> {
  ExampleCubit() : super(ExampleInitial(count: 0));

  void increment() {
    if (!_checkStateIsInitial()) {
      reset();
      return;
    }
    emit(ExampleInitial(count: (state as ExampleInitial).count + 1));
  }

  void decrement() {
    if (!_checkStateIsInitial()) {
      reset();
      return;
    }
    emit(ExampleInitial(count: (state as ExampleInitial).count - 1));
  }

  void reset() => emit(ExampleInitial(count: 0));

  bool _checkStateIsInitial() {
    return state is ExampleInitial;
  }
}

import 'package:flutter/material.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart';

part 'example_event.dart';

part 'example_state.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc() : super(ExampleNone()) {
    on<ExampleEvent>((event, emit) {
      switch (event) {
        case IncrementEvent _:
          if (!checkStateIsInitial()) {
            resetCounter(emit);
            return;
          }
          emit(ExampleInitial(counter: (state as ExampleInitial).counter + 1));
        case DecrementEvent _:
          if (!checkStateIsInitial()) {
            resetCounter(emit);
            return;
          }
          emit(ExampleInitial(counter: (state as ExampleInitial).counter - 1));
        case ResetEvent _:
          resetCounter(emit);
      }
    });
  }

  bool checkStateIsInitial() {
    return state is ExampleInitial;
  }

  void resetCounter(Emitter<ExampleState> emit) {
    emit(ExampleInitial(counter: 0));
  }
}
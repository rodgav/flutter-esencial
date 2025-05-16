import 'package:mvvm/app/utils/either.dart' show Either;
import 'package:mvvm/domain/model/failure_model.dart' show FailureModel;

abstract class BaseUseCase<In, Out> {
  Future<Either<FailureModel, Out>> execute(In input);
}

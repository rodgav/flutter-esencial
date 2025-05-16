abstract class Either<L, R> {
  factory Either.left(L value) = Left<L, R>;
  factory Either.right(R value) = Right<L, R>;

  T when<T>({required T Function(L left) left, required T Function(R right) right});
}

class Left<L, R> implements Either<L, R> {
  final L value;

  Left(this.value);

  @override
  T when<T>({required T Function(L left) left, required T Function(R right) right}) {
    return left(value);
  }
}

class Right<L, R> implements Either<L, R> {
  final R value;

  Right(this.value);

  @override
  T when<T>({required T Function(L left) left, required T Function(R right) right}) {
    return right(value);
  }
}

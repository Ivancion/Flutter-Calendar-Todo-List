abstract class FutureUseCase<Type, Params> {
  Future<Type> call(Params params);
}

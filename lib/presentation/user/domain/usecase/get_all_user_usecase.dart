import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/core/usecase/usecase.dart';
import 'package:clean_architecture/presentation/user/domain/entities/user_entities.dart';
import 'package:clean_architecture/presentation/user/domain/repositories/user_repository.dart';

class GetAllUserUsecase
    implements UseCase<DataState<List<UserEntity>>, NoParams> {
  final UserRepository repository;

  GetAllUserUsecase(this.repository);

  @override
  Future<DataState<List<UserEntity>>> call({NoParams? params}) {
    return repository.getAllUser();
  }
}

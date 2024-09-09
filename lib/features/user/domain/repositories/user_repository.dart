import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/features/user/domain/entities/user_entities.dart';

abstract class UserRepository {
  Future<DataState<List<UserEntity>>> getAllUser();
}

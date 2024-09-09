import 'package:news_app_clean_architecture/core/resources/data_state.dart';
import 'package:news_app_clean_architecture/features/user/domain/entities/user_entities.dart';

abstract class UserRepository {
  Future<DataState<List<UserEntity>>> getAllUser();
}

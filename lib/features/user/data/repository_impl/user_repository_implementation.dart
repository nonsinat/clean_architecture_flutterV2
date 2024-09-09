import 'package:news_app_clean_architecture/core/resources/data_state.dart';
import 'package:news_app_clean_architecture/features/user/data/data_sources/user_api_service.dart';
import 'package:news_app_clean_architecture/features/user/domain/entities/user_entities.dart';
import 'package:news_app_clean_architecture/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApiService apiService;

  UserRepositoryImpl(this.apiService);

  @override
  Future<DataState<List<UserEntity>>> getAllUser() async {
    try {
      final users = await apiService.getAllUsers();
      return DataSuccess(users
          .map(
            (userModel) => UserEntity(
              id: userModel.id,
              firstName: userModel.firstName,
              lastName: userModel.lastName,
              email: userModel.email,
              gender: userModel.gender,
            ),
          )
          .toList());
    } catch (e) {
      throw Exception();
    }
  }
}

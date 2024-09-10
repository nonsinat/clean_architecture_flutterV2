import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/presentation/user/domain/entities/user_entities.dart';
import 'package:clean_architecture/presentation/user/domain/usecase/get_all_user_usecase.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetAllUserUsecase getAllUserUsecase;
  UserBloc(this.getAllUserUsecase) : super(UserInitial()) {
    on<FetchAllUser>((event, emit) async {
      try {
        emit(UserLoading());
        final result = await getAllUserUsecase.call();
        if (result is DataSuccess) {
          emit(UserLoaded(result.data!));
        } else if (result is DataFailed) {
          emit(UserError());
        }
      } catch (e) {
        emit(UserError());
      }
    });
  }
}

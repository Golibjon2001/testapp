import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import 'package:testapp/core/use_case/use_case.dart';
import 'package:testapp/features/home/domain/entity/user_entity.dart';
import 'package:testapp/features/home/domain/usecase/get_user.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserUseCase getUserUseCase;

  UserBloc({required this.getUserUseCase}) : super(const UserState()) {
    on<GetUserEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        final result = await getUserUseCase.call(NoParams());
        if (result.isRight) {
          emit(state.copyWith(userList: result.right, status: FormzSubmissionStatus.success));
        }
      } catch (e) {
        print(e.toString());
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    });
  }
}

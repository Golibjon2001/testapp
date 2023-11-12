part of 'user_bloc.dart';

@immutable
class UserState extends Equatable {
  final List<UserEntity>? userList;
  final FormzSubmissionStatus? status;

  const UserState({
    this.userList,
    this.status,
  });

  UserState copyWith({
    List<UserEntity>? userList,
    FormzSubmissionStatus? status,
  }) =>
      UserState(
        userList: userList ?? this.userList,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [userList, status];
}

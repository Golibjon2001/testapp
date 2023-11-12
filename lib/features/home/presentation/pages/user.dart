import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:testapp/assets/colors/colors.dart';
import 'package:testapp/core/singeltons/service_locator.dart';
import 'package:testapp/features/home/data/repository_impl/user_repository_impl.dart';
import 'package:testapp/features/home/domain/usecase/get_user.dart';
import 'package:testapp/features/home/presentation/bloc/user_bloc/user_bloc.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late UserBloc userBloc;

  @override
  void initState() {
    userBloc = UserBloc(
      getUserUseCase: GetUserUseCase(serviceLocator<UserRepositoryImpl>()),
    )..add(GetUserEvent());
    super.initState();
  }

  @override
  void dispose() {
    userBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: userBloc,
      child: Scaffold(
        backgroundColor: scaffoldBackground,
        appBar: AppBar(
          backgroundColor: scaffoldBackground,
          elevation: 0,
          title: Text(
            "User Info",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state.status == FormzSubmissionStatus.inProgress) {
              return const Center(child: CupertinoActivityIndicator());
            } else if (state.status == FormzSubmissionStatus.success) {
              return ListView.separated(
                padding: const EdgeInsets.all(20),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name: ${state.userList?[index].name ?? ''}",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        "Email: ${state.userList?[index].email ?? ''}",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemCount: state.userList?.length ?? 0,
              );
            } else if (state.status == FormzSubmissionStatus.failure) {
              return const Center(child: Text("Fail"));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

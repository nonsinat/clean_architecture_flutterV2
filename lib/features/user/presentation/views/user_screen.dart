// lib/features/user/presentation/pages/user_list_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architecture/injection_container.dart';
import '../bloc/user_bloc.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: BlocProvider(
        create: (context) => sl<UserBloc>()..add(FetchAllUser()),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UserLoaded) {
              return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  final user = state.users[index];
                  return ListTile(
                    title: Text('${user.firstName} ${user.lastName}'),
                    subtitle: Text(user.email),
                  );
                },
              );
            } else if (state is UserError) {
              return const Center(child: Text('Error:'));
            }
            return Container();
          },
        ),
      ),
    );
  }
}

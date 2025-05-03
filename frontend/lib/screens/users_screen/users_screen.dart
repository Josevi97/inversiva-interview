import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/users/components/user_card.dart';
import 'package:frontend/features/users/components/user_card_scope.dart';
import 'package:frontend/screens/create_user_screen/create_user_screen.dart';
import 'package:frontend/screens/update_user_screen/update_user_screen.dart';
import 'package:frontend/screens/users_screen/bloc/users_screen_bloc.dart';

class UsersScreen extends StatefulWidget {
  static const routeName = "/users";

  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  late final UsersScreenBloc _viewBloc;

  @override
  void initState() {
    _viewBloc = UsersScreenBloc()..add(UsersScreenFetch());

    super.initState();
  }

  @override
  void dispose() {
    _viewBloc.close();

    super.dispose();
  }

  void _onAddUser(BuildContext context) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return CreateUserScreen();
        },
      ),
    );

    if (result is CreateUserScreenResult) {
      _viewBloc.add(UsersScreenCreate(userDto: result.userDto));
    }
  }

  Widget _buildContent(UsersScreenState state) {
    return UserCardScope(
      delegate: UserCardScopeDelegate(
        onUpdate: (context, user) async {
          final result = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return UpdateUserScreen(user: user);
              },
            ),
          );

          if (result is UpdateUserScreenResult) {
            _viewBloc.add(
              UsersScreenUpdate(id: user.id, userDto: result.userDto),
            );
          }
        },
        onDelete: (context, user) {
          _viewBloc.add(UsersScreenDelete(id: user.id));
        },
      ),
      child: ListView.builder(
        itemCount: state.users.length,
        itemBuilder: (context, index) {
          final user = state.users[index];
          return UserCard(user: user);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Usuarios"),
        actions: [
          IconButton(
            onPressed: () => _onAddUser(context),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: BlocBuilder<UsersScreenBloc, UsersScreenState>(
        bloc: _viewBloc,
        builder: (context, state) {
          if (state.isLoaded) {
            return _buildContent(state);
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

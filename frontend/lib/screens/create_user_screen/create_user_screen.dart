import 'package:flutter/material.dart';
import 'package:frontend/features/users/dtos/create_user_dto.dart';
import 'package:frontend/screens/create_user_screen/bloc/create_user_screen_bloc.dart';
import 'package:frontend/ui/layouts/user_screen_view_layout.dart';

class CreateUserScreenResult {
  final CreateUserDto userDto;

  CreateUserScreenResult(this.userDto);
}

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  late final CreateUserScreenCubit _viewBloc;

  @override
  void initState() {
    _viewBloc = CreateUserScreenCubit();

    super.initState();
  }

  @override
  void dispose() {
    _viewBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return UserScreenViewLayout(
      title: "Crear usuario",
      onNameChanged: (name) {
        _viewBloc.update(name: name);
      },
      onEmailChanged: (email) {
        _viewBloc.update(email: email);
      },
      onSave: () {
        final dto = _viewBloc.create();
        Navigator.of(context).pop(CreateUserScreenResult(dto));
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:frontend/features/users/dtos/update_user_dto.dart';
import 'package:frontend/features/users/user.dart';
import 'package:frontend/screens/update_user_screen/bloc/update_user_screen_bloc.dart';
import 'package:frontend/ui/layouts/user_screen_view_layout.dart';

class UpdateUserScreenResult {
  final UpdateUserDto userDto;

  UpdateUserScreenResult(this.userDto);
}

class UpdateUserScreen extends StatefulWidget {
  final User user;

  const UpdateUserScreen({super.key, required this.user});

  @override
  State<UpdateUserScreen> createState() => _UpdateUserScreenState();
}

class _UpdateUserScreenState extends State<UpdateUserScreen> {
  late final UpdateUserScreenCubit _viewBloc;

  @override
  void initState() {
    _viewBloc = UpdateUserScreenCubit(user: widget.user);

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
      title: "Actualizar usuario ${widget.user.name}",
      initialName: widget.user.name,
      initialEmail: widget.user.email,
      onNameChanged: (name) {
        _viewBloc.update(name: name);
      },
      onEmailChanged: (email) {
        _viewBloc.update(email: email);
      },
      onSave: () {
        final dto = _viewBloc.updateDto();
        Navigator.of(context).pop(UpdateUserScreenResult(dto));
      },
    );
  }
}

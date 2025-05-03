import 'package:flutter/material.dart';

class UserScreenViewLayout extends StatelessWidget {
  final String title;

  final String? initialName;

  final String? initialEmail;

  final Function(String name) onNameChanged;

  final Function(String name) onEmailChanged;

  final Function() onSave;

  const UserScreenViewLayout({
    super.key,
    required this.title,
    this.initialName,
    this.initialEmail,
    required this.onNameChanged,
    required this.onEmailChanged,
    required this.onSave,
  });

  Widget _buildBody() {
    final children = [
      TextFormField(
        decoration: InputDecoration(
          label: Text("Nombre"),
          hintText: initialName,
        ),
        onChanged: onNameChanged,
      ),
      TextFormField(
        decoration: InputDecoration(
          label: Text("Email"),
          hintText: initialEmail,
        ),
        onChanged: onEmailChanged,
      ),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: children.length,
      itemBuilder: (context, index) {
        return children[index];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [IconButton(onPressed: onSave, icon: Icon(Icons.check))],
      ),
      body: _buildBody(),
    );
  }
}

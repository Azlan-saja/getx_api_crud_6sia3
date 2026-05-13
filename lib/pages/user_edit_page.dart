import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_crud_6sia3/controllers/user_controller.dart';
import 'package:getx_api_crud_6sia3/models/user_model.dart';

class UserEditPage extends StatelessWidget {
  final UserModel user;
  UserEditPage({super.key, required this.user});

  final userCtrl = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    final nameCtrl = TextEditingController(text: user.name);
    final emailCtrl = TextEditingController(text: user.email);

    return Scaffold(
      appBar: AppBar(title: Text('Ubah User')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: nameCtrl,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 8),
            TextField(
              controller: emailCtrl,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                userCtrl.editUser(user.id, nameCtrl.text, emailCtrl.text);
              },
              child: Text('Simpan Perubahan'),
            ),
          ],
        ),
      ),
    );
  }
}

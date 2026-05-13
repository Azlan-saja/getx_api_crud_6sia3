import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_crud_6sia3/controllers/user_controller.dart';

class UserAddPage extends StatelessWidget {
  UserAddPage({super.key});

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final userCtrl = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambah User')),
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
                userCtrl.addUser(nameCtrl.text, emailCtrl.text);
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}

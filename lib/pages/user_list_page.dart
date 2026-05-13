import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_crud_6sia3/controllers/user_controller.dart';

class UserListPage extends StatelessWidget {
  UserListPage({super.key});

  final UserC = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Data User (CRUD GetX + API)")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: Obx(() {
        if (UserC.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: UserC.users.length,
          itemBuilder: (context, index) {
            final user = UserC.users[index];
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(user.name.substring(0, 1).toUpperCase()),
                ),
                title: Text(user.name),
                subtitle: Text(user.email),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      color: Colors.blue,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () {
                        Get.dialog(
                          AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            title: Text('Info Hapus'),
                            content: Text('Yakin hapus user ${user.name}?'),
                            actions: [
                              TextButton(
                                onPressed: () => Get.back(),
                                child: Text('Batal'),
                              ),
                              ElevatedButton.icon(
                                onPressed: () {
                                  UserC.deleteUser(user.id);
                                  Get.back();
                                },
                                icon: Icon(Icons.delete, color: Colors.red),
                                label: Text('Hapus'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}

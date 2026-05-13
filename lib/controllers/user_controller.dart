import 'package:get/get.dart';
import 'package:getx_api_crud_6sia3/models/user_model.dart';
import 'package:getx_api_crud_6sia3/services/api_service.dart';

class UserController extends GetxController {
  final service = ApiService();
  var users = <UserModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  // C => Create  => Tambah data baru
  void addUser(String name, String email) async {
    final newUser = await service.createUser(name, email);
    if (newUser != null) {
      users.add(newUser);
      Get.back();
      Get.snackbar("Sukses", "User berhasil ditambahkan");
    } else {
      Get.snackbar("Gagal", "Gagal menambahkan user");
    }
  }

  // R => Read    => Tampilkan data
  void fetchUsers() async {
    isLoading.value = true;
    final data = await service.getUsers();
    users.assignAll(data);
    isLoading.value = false;
  }

  // U => Update  => Ubah data
  void editUser(int id, String name, String email) async {
    final success = await service.updateUser(id, name, email);
    if (success || id > 10) {
      int index = users.indexWhere((u) => u.id == id);
      users[index] = UserModel(id: id, name: name, email: email);
      users.refresh();
      Get.back();
      Get.snackbar("Sukses", "User berhasil diperbarui");
    } else {
      Get.snackbar("Gagal", "Gagal memperbarui user");
    }
  }

  // D => Delete  => Hapus data
  void deleteUser(int id) async {
    final success = await service.deleteUser(id);
    if (success) {
      users.removeWhere((u) => u.id == id);
      Get.snackbar("Sukses", "User terhapus");
    } else {
      Get.snackbar("Gagal", "Gagal menghapus user");
    }
  }
}

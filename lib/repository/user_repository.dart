import 'package:bloc_example_jscarl/models/users.dart';
import 'package:bloc_example_jscarl/services/user_services.dart';

class UserRepository {
  final UserServices userServices = UserServices();

  Future<List<Users>> fetchUsers() async {
    return await this.userServices.fetchUsers();
  }
}
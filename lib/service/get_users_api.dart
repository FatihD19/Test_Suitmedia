import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });
}

Future<List<User>> fetchUsers() async {
  final url = 'https://reqres.in/api/users?page=1&per_page=10';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final userList = data['data'] as List<dynamic>;

    return userList.map((userData) {
      return User(
        id: userData['id'],
        email: userData['email'],
        firstName: userData['first_name'],
        lastName: userData['last_name'],
        avatar: userData['avatar'],
      );
    }).toList();
  } else {
    throw Exception('Failed to fetch users');
  }
}

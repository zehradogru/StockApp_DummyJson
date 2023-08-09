import 'package:flutter/material.dart';
import 'package:list_app/pages/user_detail_page.dart';
import 'package:list_app/service/user_service.dart';
import '../models/user_model.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final UserService userService = UserService();
  late Future<UserModel> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = userService.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<UserModel>(
        future: futureUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.users!.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return _buildUserModel(snapshot.data!);
                } else {
                  return _buildUserInfo(context, snapshot.data!.users![index]);
                }
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}



Widget _buildUserModel(UserModel userModel) {
  return ListTile(
    title: Text('Total: ${userModel.total}'),
    //subtitle: Text('Skip: ${stockModel.skip}, Limit: ${stockModel.limit}'),
  );
}



Widget _buildUserInfo(BuildContext context, Users user) {
  return InkWell(
    onTap: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) =>  UserDetailPage(user: user),
          )
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: ListTile(
            title: Text.rich(
              TextSpan(
                text: user.firstName ?? 'No Name',
                children: [
                  const TextSpan(text: ' '),
                  TextSpan(
                    text: user.lastName ?? 'No Last Name',
                   // style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            subtitle: Text('Age: ${user.age ?? 'No Age'}  ${user.gender ?? 'No Gender'}'),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.image ?? ''),
            ),

            // subtitle: Text(product.description ?? 'No Description'),
           // trailing: Text('Price: ${product.price}'),
            //leading: CircleAvatar(
              //backgroundImage: NetworkImage(product.thumbnail ?? ''),
            ),
          ),
        ),
      ),
  );
}

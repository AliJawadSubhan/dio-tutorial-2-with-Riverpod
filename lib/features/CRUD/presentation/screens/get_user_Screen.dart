import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackermoondiooo/features/CRUD/presentation/view_models/user_list_provider.dart';

class UserList extends ConsumerStatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  ConsumerState<UserList> createState() => _UserListState();
}

class _UserListState extends ConsumerState<UserList> {
  late UserListProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = ref.watch(getUsersProvider);
    provider.init();
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Employees",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: provider.isLoading
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: provider.users.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.network(
                                      "${provider.users[index].avatar}")),
                              title: Text('${provider.users[index].firstName}'),
                              subtitle:
                                  Text('${provider.users[index].lastName}'),
                            );
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.indigo, // Using the primary color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          provider.navigatetoCreation(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 120,
                          child: const Text(
                            "Generate",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : const Center(child: CircularProgressIndicator()));
  }
}

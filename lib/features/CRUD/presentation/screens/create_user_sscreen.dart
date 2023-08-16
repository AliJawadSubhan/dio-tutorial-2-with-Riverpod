import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackermoondiooo/features/CRUD/presentation/widgets/user_dialogbox.dart';

import '../view_models/create_user.dart';

class CreateUser extends ConsumerStatefulWidget {
  const CreateUser({Key? key}) : super(key: key);

  @override
  ConsumerState<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends ConsumerState<CreateUser> {
  late NewUserProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = ref.watch(createNewUserProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        title: const Text(
          "Employee Form",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
          child: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Generate the Employee",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: const InputDecoration(hintText: 'Enter name'),
                controller: provider.nameController,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: const InputDecoration(hintText: 'Enter job'),
                controller: provider.jobController,
              ),
              const SizedBox(
                height: 20,
              ),
              provider.isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        await provider.createNewUser().then((s) {
                          showDialog(
                            context: context,
                            builder: (context) => NewUserDialog(
                              provider: provider,
                            ),
                          );
                          provider.nameController.clear();

                          provider.jobController.clear();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.indigo, // Using the primary color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 120,
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    )
            ],
          ),
        ),
      )),
    );
  }
}

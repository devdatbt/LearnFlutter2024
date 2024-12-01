import 'package:flutter/material.dart';

import '../app_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRouter.loginRoute);
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Welcome to Home Screen!'),
      ),
    );
  }
}
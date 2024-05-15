import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/data/network/firestore_db.dart';
import 'package:shoesly/presentation/views/discover_view.dart';

import '../bloc/discover_cubit/discover_cubit.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  navigate() async {
    //Ucomment this line inorder to add data to firestore for now we are adding data manually
    //  await FirestoreDB().uploadData();
    context.read<DiscoverCubit>().fetchData();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return const DiscoverView();
        },
      ), (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "Shoesly",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          )),
        ],
      ),
    );
  }
}

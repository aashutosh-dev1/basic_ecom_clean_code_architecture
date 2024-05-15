import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/core/routes/routes.dart';
import 'package:shoesly/domain/repository/fetch_data_repository.dart';
import 'package:shoesly/firebase_options.dart';
import 'package:shoesly/presentation/bloc/cart_cubit/cart_cubit.dart';
import 'package:shoesly/presentation/bloc/discover_cubit/discover_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<FetchDataRepository>(
      create: (context) => FetchDataRepositoryImpl(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DiscoverCubit.of(context),
          ),
          BlocProvider(
            create: (context) => CartCubit(),
          ),
        ],
        child: MaterialApp(
          title: 'Shoesly',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.splashRoute,
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}

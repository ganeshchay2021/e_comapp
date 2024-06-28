import 'package:e_comapp/Repository/cart_repository.dart';
import 'package:e_comapp/pages/Navigation%20Bar/nav_bar_screen.dart';
import 'package:e_comapp/Repository/favourite_repository.dart';
import 'package:e_comapp/pages/Product%20Details%20Screen/bloc/cart%20bloc/cart_bloc.dart';
import 'package:e_comapp/pages/Product%20Details%20Screen/bloc/favourite%20bloc/favourite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider(
        create: (context) => FavouriteRepository(),
      ),
      RepositoryProvider(
        create: (context) => CartRepository(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() {
    Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FavouriteBloc(productRepository: FavouriteRepository()),
        ),
        BlocProvider(
          create: (context) => CartBloc(cartRepository: CartRepository()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.mulishTextTheme(),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const BottomNavBar(),
      ),
    );
  }
}

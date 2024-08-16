import 'package:flutter/material.dart';
import 'package:kayple/core/constants/route_paths.dart';
import 'package:kayple/core/viewmodels/base_viewmodel.dart';
import 'package:kayple/firebase_options.dart';
import 'package:kayple/ui/design_systems/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:kayple/ui/router.dart' as router;
import 'package:firebase_core/firebase_core.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BaseViewmodel()),
      ],
      child: MaterialApp(
        title: 'kayple',
        theme: ThemeData(
          primaryColor: AppColors.primary,
          scaffoldBackgroundColor: AppColors.background,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.background,
            surfaceTintColor: AppColors.background,
            iconTheme: IconThemeData(
              color: AppColors.primary,
            ),
            actionsIconTheme: IconThemeData(
              color: AppColors.white,
            ),
          ),
        ),
        initialRoute: RoutePaths.Home,
        onGenerateRoute: router.Router.generateRoute,
      ),
    );
  }
}

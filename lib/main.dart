import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:watch_loop/firebase_options.dart';
import 'package:watch_loop/layout/home_layout.dart';
import 'package:watch_loop/modules/selected_episode.dart';
import 'package:watch_loop/modules/vedio.dart';
import 'package:watch_loop/shared/cubit/states.dart';

import 'shared/cubit/cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => Appcubit()..getCategoriesData()),
       ],
      child: BlocConsumer<Appcubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(360, 640),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                  scrollBehavior: MyCustomScrollBehavior(),
                  useInheritedMediaQuery: true,
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    brightness: Brightness.light,
                    /* light theme settings */
                  ),
                  darkTheme: ThemeData(
                      brightness: Brightness.dark, primaryColor: HexColor("#FFD700")

                    /* dark theme settings */
                  ),
                  themeMode: ThemeMode.dark,
                  home: HomeLayout());
            },
          );
        },
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}

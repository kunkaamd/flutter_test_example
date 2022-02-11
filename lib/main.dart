import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:test_round_1/base/global_binding.dart';
import 'package:test_round_1/pages/category.dart';
import 'package:test_round_1/pages/sign_up.dart';
import 'package:test_round_1/resources/app_color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalBinding.setupInjector();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 818),
      builder: () => GetMaterialApp(
        builder: (context, widget) {
          //add this line
          ScreenUtil.setContext(context);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            fontFamily: "Lato",
            primaryColor: AppColor.h647FFF
        ),
        initialRoute: '/categories',
        getPages: [
          GetPage(name: '/sign-up', page: () => SignUp()),
          GetPage(name: '/categories', page: () => Category()),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shak_bespoke/core/binding/controller_binder.dart';
import 'package:shak_bespoke/routes/app_route.dart';

class ShakBespoke extends StatelessWidget {
  const ShakBespoke({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Approute.subscriptionScreen,
          getPages: Approute.routes,
          builder: EasyLoading.init(),
          initialBinding: ControllerBinder(),
          themeMode: ThemeMode.system,
          // theme: AppTheme.lightTheme,
          // darkTheme: AppTheme.darkTheme,
        );
      },
    );
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:install_plugin/install_plugin.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:fomoplay/repo/update_apk_repo.dart';
import 'package:fomoplay/res/app_const.dart';
import 'package:fomoplay/utils/routes/routers_name.dart';
import 'package:fomoplay/view_modal/user_view_modal.dart';

class SplashServices with ChangeNotifier {
  Future<bool> _checkUserSessionAndManageNavigation(context) async {
    final userViewModel = Provider.of<UserViewModel>(context, listen: false);

    final isUserLoggedIn = await userViewModel.isLoggedIn();
    await Future.delayed(const Duration(seconds: 2));
    if (isUserLoggedIn) {
      Navigator.pushReplacementNamed(context, RoutesName.bottomNavBar);
    } else {
      Navigator.pushReplacementNamed(context, RoutesName.bottomNavBar);
    }

    return isUserLoggedIn;
  }

  double _loading = 0.0;
  double get loading => _loading;

  void setIndicator(double value) {
    _loading = value;
    notifyListeners();
  }

  final _updateApk = UpdateApkRepository();
  Future<void> updateApkApi(context) async {
    _updateApk.updateApkApi().then((value) {
      if (value['status'] == "200") {
        if (kDebugMode) {
          print(value);
          print("Status sedfgfghb");
          print(AppConstants.appVersion);
          print("AppConstants.appVersion dg");
        }
        if (value['data']['versions'] != AppConstants.appVersion) {
          if (kDebugMode) {
            print(AppConstants.appVersion);
            print("AppConstants.appVersion dfghb");
          }
          _downloadAndInstall(context, value['data']['link']);
        } else {
          _checkUserSessionAndManageNavigation(context);
        }
      } else {
        if (kDebugMode) {
          print("checkUserSessionAndManageNavigation");
        }
        _checkUserSessionAndManageNavigation(context);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }

  void _downloadAndInstall(context, String downloadUrl) async {
    Dio dio = Dio();
    var dir = await getExternalStorageDirectory();
    String filePath = "${dir?.path}//fomoplay.apk";

    await dio.download(
      downloadUrl,
      filePath,
      onReceiveProgress: (received, total) {
        if (total != -1) {
          double progress = (received / total);
          setIndicator(progress);
        }
      },
    );

    InstallPlugin.installApk(filePath, appId: 'com.wins_pkr.wins_pkr').then((result) {
      _checkUserSessionAndManageNavigation(context);
      if (kDebugMode) {
        print('Install result: $result');
      }
    }).catchError((error) {
      if (kDebugMode) {
        print('Install error: $error');
      }
    });
  }
}

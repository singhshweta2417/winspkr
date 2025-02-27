import 'package:flutter/material.dart';
import 'package:fomoplay/AndarBahar/andar_home_page.dart';
import 'package:fomoplay/Aviator/home_page_aviator.dart';
import 'package:fomoplay/Plinko/my_game.dart';
import 'package:fomoplay/dragon_tiger_new/dragon_tiger.dart';
import 'package:fomoplay/plinko/lesson_02/game_lesson_02.dart';
import 'package:fomoplay/view/bottom_nav_bar.dart';
import 'package:fomoplay/view/me/widgets/add_bank.dart';
import 'package:fomoplay/view/me/widgets/change_password.dart';
import 'package:fomoplay/view/me/widgets/discount_page.dart';
import 'package:fomoplay/view/me/widgets/message_page.dart';
import 'package:fomoplay/view/me/widgets/order_page.dart';
import 'package:fomoplay/view/me/widgets/personal_center_page.dart';
import 'package:fomoplay/view/me/widgets/record_page.dart';
import 'package:fomoplay/view/mines/mines.dart';
import 'package:fomoplay/view/me/widgets/customer_service.dart';
import 'package:fomoplay/view/promotion/widget/invitation_rules.dart';
import 'package:fomoplay/view/promotion/widget/subordinate_data.dart';
import 'package:fomoplay/view/splash_screen.dart';
import 'package:fomoplay/utils/routes/routers_name.dart';
import 'package:fomoplay/view/auth/login_page.dart';
import 'package:fomoplay/view/auth/register_page.dart';
import 'package:fomoplay/view/trx/trx.dart';

import 'package:fomoplay/view/wingo/win_go.dart';

class Routers {
  static WidgetBuilder generateRoute(String routeName) {
    switch (routeName) {
      case RoutesName.splashScreen:
        return (context) => const Splash();
      case RoutesName.bottomNavBar:
        return (context) => const BottomNavBar();
      case RoutesName.login:
        return (context) => const Login();
      case RoutesName.register:
        return (context) => const Register();
      case RoutesName.changePassword:
        return (context) => const ChangePassword();
      case RoutesName.addBank:
        return (context) => const AddBank();
      case RoutesName.winGoHome:
        return (context) => const WinGo();
      case RoutesName.aviator:
        return (context) => const GameAviator();
      case RoutesName.mines:
        return (context) => const Mines();
        case RoutesName.andarBahar:
        return (context) => const AndarBaharHome(gameId: '13',);
      case RoutesName.plinko:
        return (context) => MyGameWidget(game: PlinkoMains());
    case RoutesName.dragonTiger:
    return (context) =>  const DragonTiger(gameId: '10',);
      case RoutesName.subordinateDate:
        return (context) => const SubordinateDataPage();
      case RoutesName.invitationRules:
        return (context) => const InvitationRulesPage();
      case RoutesName.customerService:
        return (context) => const CustomerService();
      case RoutesName.message:
        return (context) => const MessageScreen();
      case RoutesName.order:
        return (context) => const OrderScreen(initialIndex: 0,);
      case RoutesName.record:
        return (context) => const RecordPage();
      case RoutesName.discount:
        return (context) => const DiscountScreen();
      case RoutesName.personalCenter:
        return (context) => const PersonalCenter();
      case RoutesName.trx:
        return (context) => const Trx();


      default:
        return (context) => const Scaffold(
              body: Center(
                child: Text(
                  'No Route Found!',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
            );
    }
  }
}

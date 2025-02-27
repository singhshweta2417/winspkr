import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fomoplay/view/wingo/controller/win_go_controller.dart';
import 'package:fomoplay/view/wingo/widgets/game_history.dart';
import 'package:fomoplay/view/wingo/widgets/my_history.dart';
import 'package:fomoplay/view/wingo/widgets/win_go_chart.dart';

class WinGoTab extends StatelessWidget {
  const WinGoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WinGoController>(builder: (context, wgc, child) {
      if (wgc.gameDataTab == 0) {
        return const GameHistory();
      } else if (wgc.gameDataTab == 1) {
        return const WinGoChart();
      } else {
        return const WingoMyHis();
      }
    });
  }
}

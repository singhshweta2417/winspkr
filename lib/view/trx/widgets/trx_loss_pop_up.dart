import 'package:flutter/material.dart';
import 'package:fomoplay/generated/assets.dart';
import 'package:fomoplay/main.dart';

class TrxLossPopUp extends StatelessWidget {
  final int winNumber;
  final dynamic winAmount;
  final int gameSrNo;
  final int gameId;
  final String result;

  const TrxLossPopUp({
    super.key,
    required this.winNumber,
    this.winAmount,
    required this.gameSrNo,
    required this.gameId,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    List<Color> colors;
    if (gameId == 0) {
      colors = [
        const Color(0xFFfd565c),
        const Color(0xFFb659fe),
      ];
    } else if (gameId == 5) {
      colors = [
        const Color(0xFF40ad72),
        const Color(0xFFb659fe),
      ];
    } else if (gameId == 10) {
      colors = [
        const Color(0xFF40ad72),
        const Color(0xFF40ad72),
      ];
    } else if (gameId == 20) {
      colors = [
        const Color(0xFFb659fe),
        const Color(0xFFb659fe),
      ];
    } else if (gameId == 30) {
      colors = [
        const Color(0xFFfd565c),
        const Color(0xFFfd565c),
      ];
    } else if (gameId == 40) {
      colors = [
        const Color(0xFF40ad72),
        const Color(0xFF40ad72),
      ];
    } else if (gameId == 50) {
      colors = [
        //blue
        const Color(0xFF6da7f4),
        const Color(0xFF6da7f4)
      ];
    } else {
      colors = gameId.isOdd
          ? [
              const Color(0xFF40ad72),
              const Color(0xFF40ad72),
            ]
          : [
              const Color(0xFFfd565c),
              const Color(0xFFfd565c),
            ];
    }
    return Dialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 350,
            height: 450,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(Assets.winGoWinGoLossBg),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 120),
                const Text(
                  "Sorry",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: width * 0.04),
                    const Text(
                      "Lottery result",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Container(
                      width: width * 0.2,
                      height: height * 0.03,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        gradient: LinearGradient(
                          colors: colors,
                          stops: const [0.5, 0.5],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          tileMode: TileMode.mirror,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          gameId == 10
                              ? 'Green'
                              : gameId == 20
                                  ? 'Violet'
                                  : gameId == 30
                                      ? 'Red'
                                      : gameId == 0
                                          ? 'Violet Red'
                                          : gameId == 5
                                              ? 'Violet Green'
                                              : (gameId == 1 ||
                                                      gameId == 3 ||
                                                      gameId == 7 ||
                                                      gameId == 9)
                                                  ? 'green'
                                                  : 'red',
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Container(
                      width: width * 0.04,
                      height: height * 0.03,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: colors,
                          stops: const [0.5, 0.5],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          tileMode: TileMode.mirror,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          winNumber.toString(),
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Container(
                      width: width * 0.08,
                      height: height * 0.03,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        gradient: LinearGradient(
                          colors: colors,
                          stops: const [0.5, 0.5],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          tileMode: TileMode.mirror,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          gameId < 5 ? 'Small' : 'Big',
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Text(
                  "Lose",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.indigo.shade900,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Period : ",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      gameId == 6
                          ? "1 min"
                          : gameId == 7
                          ? "3 min"
                          : gameId == 8
                          ? "5 min"
                          :"10min",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black26,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      gameSrNo.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black26,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.cancel_outlined,
                size: 40, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

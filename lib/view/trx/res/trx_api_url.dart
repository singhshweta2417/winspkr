

import 'package:fomoplay/res/api_urls.dart';

class TrxApiUrl {
  // base url
  static const String baseUrl = ApiUrl.baseUrl;
  static const String trxBet = "${baseUrl}bets";
  static const String trxMyBetHis = "${baseUrl}bet_history";
  static const String trxGameHis = "${baseUrl}results?limit=10&game_id=";
  static const String trxResult = "${baseUrl}last_result?game_id=";
  static const String trxWinAmount = "${baseUrl}win-amount?userid=";
  // static const String allRules = "${baseUrl}all_rules?type=";

  //wingo socket url
  static const String trxSocketUrl = "https://aviatorudaan.com";
  static const String trxEvent30 = "fomotrx1";
  static const String trxEvent1 = "fomotrx3";
  static const String trxEvent3 = "fomotrx5";
  static const String trxEvent5 = "fomotrx10";
}

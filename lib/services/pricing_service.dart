import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/theme.dart';

/// Live prices from the bot's /api/pricing endpoint, with the bot's own
/// prices as fallbacks so the page never shows an empty price.
class PricingService {
  static final PricingService _instance = PricingService._internal();
  factory PricingService() => _instance;
  PricingService._internal();

  bool loaded = false;
  bool isEarlyAccess = false;
  int spotsLeft = 0;
  int monthlyNgn = 3500;
  int annualNgn = 35000;
  int monthlyUsd = 15;
  int annualUsd = 150;

  /// The normal naira prices, shown crossed out during early access.
  int regularMonthlyNgn = 3500;
  int regularAnnualNgn = 35000;

  Future<void> fetch() async {
    if (loaded) return;
    try {
      final response = await http
          .get(Uri.parse(AppLinks.pricingApi))
          .timeout(const Duration(seconds: 8));
      if (response.statusCode != 200) return;
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      isEarlyAccess = data['isEarlyAccessActive'] as bool? ?? false;
      spotsLeft = data['spotsLeft'] as int? ?? 0;
      monthlyNgn = data['monthlyPriceNgn'] as int? ?? monthlyNgn;
      annualNgn = data['annualPriceNgn'] as int? ?? annualNgn;
      monthlyUsd = data['monthlyPriceUsd'] as int? ?? monthlyUsd;
      annualUsd = data['annualPriceUsd'] as int? ?? annualUsd;
      regularMonthlyNgn = data['regularMonthlyPriceNgn'] as int? ?? regularMonthlyNgn;
      regularAnnualNgn = data['regularAnnualPriceNgn'] as int? ?? regularAnnualNgn;
      loaded = true;
    } catch (_) {
      // Keep the fallback prices.
    }
  }
}

/// 35000 -> "35,000"
String withCommas(int value) => value.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]},',
    );

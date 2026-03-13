import 'dart:convert';
import 'package:http/http.dart' as http;

class PricingService {
  static final PricingService _instance = PricingService._internal();
  factory PricingService() => _instance;
  PricingService._internal();

  bool _loaded = false;
  bool get loaded => _loaded;

  bool isEarlyAccess = false;
  int spotsLeft = 0;
  int monthlyPriceNgn = 3500;
  int annualPriceNgn = 35000;
  int monthlyPriceUsd = 18;
  int annualPriceUsd = 200;

  Future<void> fetchPricing() async {
    try {
      final response = await http.get(Uri.parse('https://pennywise-bot-1077178245946.us-central1.run.app/api/pricing'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        isEarlyAccess = data['isEarlyAccessActive'] ?? false;
        spotsLeft = data['spotsLeft'] ?? 0;
        monthlyPriceNgn = data['monthlyPriceNgn'] ?? 3500;
        annualPriceNgn = data['annualPriceNgn'] ?? 35000;
        monthlyPriceUsd = data['monthlyPriceUsd'] ?? 18;
        annualPriceUsd = data['annualPriceUsd'] ?? 200;
        _loaded = true;
      }
    } catch (_) {
      // Keep defaults
    }
  }
}

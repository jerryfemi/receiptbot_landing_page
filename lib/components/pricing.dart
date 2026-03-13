import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import '../constants/theme.dart';
import 'region_detector.dart' if (dart.library.js_interop) 'region_detector_web.dart';

class Pricing extends StatefulComponent {
  const Pricing({super.key});

  @override
  State<Pricing> createState() => _PricingState();
}

class _PricingState extends State<Pricing> {
  bool _isAnnual = false;
  late final bool _isAfrican;

  // Dynamic pricing state
  bool _isLoading = true;
  bool _isEarlyAccess = false;
  int _spotsLeft = 0;

  // Default fallbacks (Standard pricing)
  int _monthlyPriceNgn = 3500;
  int _annualPriceNgn = 35000;
  int _monthlyPriceUsd = 18;
  int _annualPriceUsd = 200;

  @override
  void initState() {
    super.initState();
    _isAfrican = isAfricanRegion();
    _fetchPricing();
  }

  Future<void> _fetchPricing() async {
    try {
      final response = await http.get(Uri.parse('https://pennywise-bot-1077178245946.us-central1.run.app/api/pricing'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (!mounted) return;
        setState(() {
          _isEarlyAccess = data['isEarlyAccessActive'] ?? false;
          _spotsLeft = data['spotsLeft'] ?? 0;
          _monthlyPriceNgn = data['monthlyPriceNgn'] ?? 3500;
          _annualPriceNgn = data['annualPriceNgn'] ?? 35000;
          _monthlyPriceUsd = data['monthlyPriceUsd'] ?? 18;
          _annualPriceUsd = data['annualPriceUsd'] ?? 200;
          _isLoading = false;
        });
      } else {
        if (!mounted) return;
        setState(() => _isLoading = false);
      }
    } catch (e) {
      if (!mounted) return;
      setState(() => _isLoading = false);
    }
  }

  // Pricing based on region
  String get _price {
    // Show empty string or loading indicator if loading
    if (_isLoading) return '...';
    if (_isAfrican) {
      return _isAnnual ? '₦$_annualPriceNgn' : '₦$_monthlyPriceNgn';
    }
    return _isAnnual ? '\$$_annualPriceUsd' : '\$$_monthlyPriceUsd';
  }

  String get _period => _isAnnual ? '/year' : '/month';

  String get _freePrice => _isAfrican ? '₦0' : r'$0';

  String get _annualEquiv {
    if (_isAfrican) {
      return 'Billed as ₦$_annualPriceNgn/year';
    }
    return 'Billed as \$$_annualPriceUsd/year';
  }

  String get _monthlyEquiv {
    if (_isAfrican) {
      final savings = (_monthlyPriceNgn * 10) - _annualPriceNgn;
      // If savings is 0 (like 2000 * 10 - 20000), you might just want to show the 'or X/year' part
      if (savings <= 0) return 'or ₦$_annualPriceNgn/year';
      return 'or ₦${_monthlyPriceNgn * 10}/year — save ₦$savings';
    }
    final savings = (_monthlyPriceUsd * 10) - _annualPriceUsd;
    if (savings <= 0) return 'or \$$_annualPriceUsd/year';
    return 'or \$${_monthlyPriceUsd * 10}/year — save \$$savings';
  }

  @override
  Component build(BuildContext context) {
    return section(id: 'pricing', classes: 'section pricing-section', [
      div(classes: 'container', [
        div(classes: 'section-header reveal', [
          span(classes: 'section-label', [.text('Pricing')]),
          h2(classes: 'section-title', [.text('Simple, honest pricing')]),
          p(classes: 'section-sub center', [
            .text('Start free. Upgrade when your business is ready.'),
          ]),
        ]),
        // Monthly / Annual toggle
        div(classes: 'pricing-toggle-row reveal', [
          div(classes: 'pricing-toggle-pill', [
            button(
              classes: 'billing-tab${!_isAnnual ? ' billing-tab--active' : ''}',
              onClick: () => setState(() => _isAnnual = false),
              [.text('Monthly')],
            ),
            button(
              classes: 'billing-tab${_isAnnual ? ' billing-tab--active' : ''}',
              onClick: () => setState(() => _isAnnual = true),
              [
                .text('Annual '),
                span(classes: 'save-badge', [.text('SAVE 7%')]),
              ],
            ),
          ]),
        ]),
        // Cards
        div(classes: 'pricing-cards', [
          // Free card
          div(classes: 'pricing-card reveal', [
            h3(classes: 'pricing-plan', [.text('Free')]),
            p(classes: 'pricing-tagline', [.text('For individuals just getting started')]),
            div(classes: 'pricing-price-row', [
              span(classes: 'pricing-price', [.text(_freePrice)]),
              span(classes: 'pricing-period', [.text('/forever')]),
            ]),
            ul(classes: 'pricing-features', [
              _feature('5 receipts per month'),
              _feature('1 PDF layout (Classic)'),
              _feature('Clean PDF receipts'),
            ]),
            a(
              href: AppLinks.whatsapp,
              target: Target.blank,
              classes: 'btn-ghost pricing-btn',
              [.text('Get Started Free')],
            ),
          ]),
          // Pro card
          div(classes: 'pricing-card pricing-card--primary reveal', [
            if (_isEarlyAccess && _spotsLeft > 0)
              div(
                classes: 'early-access-banner',
                attributes: {
                  'style':
                      'position: absolute; top: -16px; left: 50%; transform: translateX(-50%); padding: 6px 16px; border-radius: 100px; background: linear-gradient(135deg, #FF6B6B 0%, #FF8E53 100%); color: white; font-weight: 700; font-size: 13px; text-align: center; white-space: nowrap;',
                },
                [.text('🔥 Early Access: Only $_spotsLeft spots remaining!')],
              )
            else
              div(classes: 'pricing-tag', [.text('Most Popular')]),
            h3(classes: 'pricing-plan', [.text('Pro')]),
            p(classes: 'pricing-tagline', [.text('For growing businesses')]),
            div(classes: 'pricing-price-row', [
              span(classes: 'pricing-price', [.text(_price)]),
              span(classes: 'pricing-period', [.text(_period)]),
            ]),
            if (_isAnnual) p(classes: 'pricing-equiv', [.text(_annualEquiv)]),
            if (!_isAnnual) p(classes: 'pricing-equiv', [.text(_monthlyEquiv)]),
            ul(classes: 'pricing-features', [
              _feature('Unlimited invoices'),
              _feature('All 4 PDF layouts'),
              _feature('Team member access'),
              _feature('Sales stats (weekly, monthly, yearly)'),
            ]),
            a(
              href: AppLinks.whatsapp,
              target: Target.blank,
              classes: 'btn-primary pricing-btn',
              [.text('Get Pro →')],
            ),
          ]),
        ]),
      ]),
    ]);
  }

  Component _feature(String text) {
    return li(classes: 'pricing-feature', [
      span(classes: 'feature-check', [.text('✓')]),
      .text(' $text'),
    ]);
  }
}

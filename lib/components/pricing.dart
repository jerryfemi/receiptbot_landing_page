import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';
import '../services/pricing_service.dart';
import 'region_detector.dart' if (dart.library.js_interop) 'region_detector_web.dart';

/// "Here's the bill": the Free and Pro plans drawn as two till receipts.
/// Prices come live from the bot, in naira for Africa and dollars elsewhere.
class Pricing extends StatefulComponent {
  const Pricing({super.key});

  @override
  State<Pricing> createState() => _PricingState();
}

class _PricingState extends State<Pricing> {
  final _prices = PricingService();
  bool _annual = false;
  bool _naira = true;

  @override
  void initState() {
    super.initState();
    _naira = isAfricanRegion();
    _prices.fetch().then((_) {
      if (mounted) setState(() {});
    });
  }

  String get _symbol => _naira ? '₦' : r'$';
  int get _monthly => _naira ? _prices.monthlyNgn : _prices.monthlyUsd;
  int get _yearly => _naira ? _prices.annualNgn : _prices.annualUsd;

  String get _proPrice => '$_symbol${withCommas(_annual ? _yearly : _monthly)}';

  String get _proNote {
    if (!_annual) return 'PER MONTH';
    final saving = _monthly * 12 - _yearly;
    return saving > 0 ? 'PER YEAR, SAVE $_symbol${withCommas(saving)}' : 'PER YEAR';
  }

  String get _yearlyTabLabel {
    final months = _monthly > 0 ? ((_monthly * 12 - _yearly) / _monthly).floor() : 0;
    return months >= 1 ? 'Yearly, $months months free' : 'Yearly';
  }

  @override
  Component build(BuildContext context) {
    final showEarlyAccess = _naira && _prices.isEarlyAccess && _prices.spotsLeft > 0;
    return section(id: 'pricing', classes: 'wrap section-pad pricing', [
      div(classes: 'pricing-head', [
        h2(classes: 'section-title', [.text("Here's the bill.")]),
        p(classes: 'section-sub', [.text('Start free. Pay when Remi is doing real work for you.')]),
        div(classes: 'period', attributes: const {'role': 'group', 'aria-label': 'Billing period'}, [
          _tab('Monthly', !_annual, () => setState(() => _annual = false)),
          _tab(_yearlyTabLabel, _annual, () => setState(() => _annual = true)),
        ]),
      ]),
      div(classes: 'bills', [
        _bill(
          name: 'Free',
          tagline: 'FOR GETTING STARTED',
          lines: [
            ('RECEIPTS / MONTH', '$freeReceiptsPerMonth'),
            ('LAYOUT', 'STUDIO'),
            ('LOGO + BANK DETAILS', 'YES'),
            ('VOICE NOTES', 'YES'),
          ],
          total: '${_symbol}0',
          note: null,
          stamp: 'FREE',
          pro: false,
          cta: 'Start free',
        ),
        _bill(
          name: 'Pro',
          tagline: 'FOR A BUSY SHOP',
          lines: [
            ('RECEIPTS / MONTH', 'UNLIMITED'),
            ('LAYOUTS', 'ALL 4'),
            ('TEAM MEMBERS', 'YES'),
            ('SALES TOTALS', 'YES'),
          ],
          total: _proPrice,
          note: _proNote,
          stamp: 'PAID',
          pro: true,
          cta: 'Upgrade in the chat',
        ),
      ]),
      if (showEarlyAccess)
        p(classes: 'mono-note center', [
          .text('Early access: ${_prices.spotsLeft} spots left at ₦${withCommas(_prices.monthlyNgn)} a month.'),
        ]),
    ]);
  }

  Component _tab(String label, bool on, void Function() onTap) {
    return button(
      classes: 'period-tab${on ? ' period-tab--on' : ''}',
      attributes: {'type': 'button', 'aria-pressed': '$on'},
      onClick: onTap,
      [.text(label)],
    );
  }

  Component _bill({
    required String name,
    required String tagline,
    required List<(String, String)> lines,
    required String total,
    required String? note,
    required String stamp,
    required bool pro,
    required String cta,
  }) {
    return div(classes: 'bill${pro ? ' bill--pro' : ''}', [
      div(classes: 'zig-top', []),
      div(classes: 'bill-body', [
        span(classes: 'bill-name', [.text(name)]),
        span(classes: 'bill-tagline', [.text(tagline)]),
        span(classes: 'slip-dash', []),
        for (final (label, value) in lines)
          span(classes: 'slip-line', [span([.text(label)]), span([.text(value)])]),
        span(classes: 'slip-double', []),
        span(classes: 'slip-line slip-total', [
          span([.text('TOTAL')]),
          span(classes: 'bill-total', [.text(total)]),
        ]),
        if (note != null) span(classes: 'bill-note', [.text(note)]),
        div(classes: 'slip-stamp-row', [
          span(classes: 'stamp ${pro ? 'stamp-red' : 'stamp-ink'}', [.text(stamp)]),
        ]),
        a(
          href: AppLinks.whatsapp,
          target: Target.blank,
          attributes: const {'rel': 'noopener noreferrer'},
          classes: 'btn ${pro ? 'btn-solid' : 'btn-line'} bill-btn',
          [.text(cta)],
        ),
      ]),
      div(classes: 'zig-bottom', []),
    ]);
  }
}

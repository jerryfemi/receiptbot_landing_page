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

  @override
  void initState() {
    super.initState();
    _isAfrican = isAfricanRegion();
  }

  // Pricing based on region
  String get _price {
    if (_isAfrican) {
      return _isAnnual ? '₦35,000' : '₦3,500';
    }
    return _isAnnual ? r'$200' : r'$18';
  }

  String get _period => _isAnnual ? '/year' : '/month';

  String get _freePrice => _isAfrican ? '₦0' : r'$0';

  String get _annualEquiv {
    if (_isAfrican) {
      return 'Billed as ₦35,000/year';
    }
    return r'Billed as $200/year';
  }

  String get _monthlyEquiv {
    if (_isAfrican) {
      return 'or ₦35,000/year — save ₦7,000';
    }
    return r'or $200/year — save $16';
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

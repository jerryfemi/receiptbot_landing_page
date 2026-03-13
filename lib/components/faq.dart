import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import '../services/pricing_service.dart';
import 'region_detector.dart' if (dart.library.js_interop) 'region_detector_web.dart';

class Faq extends StatefulComponent {
  const Faq({super.key});

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  int _open = -1;
  final _pricingService = PricingService();
  late final bool _isAfrican;

  @override
  void initState() {
    super.initState();
    _isAfrican = isAfricanRegion();
    if (!_pricingService.loaded) {
      _initPricing();
    }
  }

  Future<void> _initPricing() async {
    await _pricingService.fetchPricing();
    if (!mounted) return;
    setState(() {});
  }

  List<({String q, String a})> get _items {
    final monthly = _isAfrican ? '₦${_pricingService.monthlyPriceNgn}' : '\$${_pricingService.monthlyPriceUsd}';
    final annual = _isAfrican ? '₦${_pricingService.annualPriceNgn}' : '\$${_pricingService.annualPriceUsd}';
    final proPrice = '$monthly/month or $annual/year';

    return [
      (
        q: 'What is Remi?',
        a: 'Remi is a WhatsApp bot that turns your text messages and receipt photos into professional PDF receipts & invoices — sent right back to you in chat.',
      ),
      (
        q: 'How do I start using Remi?',
        a: 'Tap "Get Started" or scan the QR code. This opens WhatsApp with Remi ready to go. No signup, no app install — just tell Remi what you sold to get started.',
      ),
      (
        q: 'Does it only work with text messages?',
        a: 'No! Remi can parse photos of handwritten receipts, but its primary strength is natural language. Just type "Sold 2 laptops to John for \$800" and Remi handles the rest.',
      ),
      (
        q: 'What receipt types does Remi support?',
        a: 'Remi works with physical receipt photos (JPG, PNG), handwritten notes, and plain text. If it has a total and a description, Remi can extract the data.',
      ),
      (
        q: 'Is my data stored anywhere?',
        a: 'Remi processes your data to generate the PDF but does not sell or share it with third parties. Your business history stays private to your account.',
      ),
      (
        q: "What's included in Pro?",
        a: 'The Free plan gives you 5 receipts per month. Pro unlocks unlimited receipts, all 4 premium PDF layouts, custom business logos, team member access, Sales Insights and priority support.',
      ),
      (
        q: 'How much does it cost?',
        a: 'Remi starts free. Pro is $proPrice. Localized pricing and early access deals are automatically handled at checkout.',
      ),
      (
        q: 'How do I cancel my subscription?',
        a: 'You can cancel anytime by messaging Remi in WhatsApp with the command "cancel subscription". Your Pro access remains until the end of your billing period.',
      ),
    ];
  }

  @override
  Component build(BuildContext context) {
    return section(id: 'faq', classes: 'section faq-section', [
      div(classes: 'container faq-container', [
        div(classes: 'section-header reveal', [
          span(classes: 'section-label', [.text('FAQ')]),
          h2(classes: 'section-title', [.text('Common questions,\nhonest answers')]),
        ]),
        div(classes: 'faq-list', [
          for (int i = 0; i < _items.length; i++) _buildItem(i),
        ]),
      ]),
    ]);
  }

  Component _buildItem(int index) {
    final isOpen = _open == index;
    return div(classes: 'faq-item${isOpen ? ' faq-item--open' : ''}', [
      button(
        classes: 'faq-question',
        onClick: () => setState(() => _open = isOpen ? -1 : index),
        [
          span([.text(_items[index].q)]),
          span(classes: 'faq-chevron', [.text(isOpen ? '−' : '+')]),
        ],
      ),
      div(classes: 'faq-answer${isOpen ? ' faq-answer--open' : ''}', [
        p([.text(_items[index].a)]),
      ]),
    ]);
  }
}

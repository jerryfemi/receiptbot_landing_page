import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class Faq extends StatefulComponent {
  const Faq({super.key});

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  int _open = -1;

  static const _items = [
    (
      q: 'What is Remi?',
      a: 'Remi is a WhatsApp bot that turns your text messages and receipt photos into professional PDF receipts & invoices — sent right back to you in chat.',
    ),
    (
      q: 'How do I start using Remi?',
      a: 'Tap "Get Started" or scan the QR code. This opens WhatsApp with Remi ready to go. No signup, no app install — just tell Remi what you sold to get started.',
    ),
    (
      q: 'Does it only work with photos?',
      a: 'No! While Remi can parse handwritten receipt photos, its primary feature is natural language. Just type "Sold 2 laptops to John for \$800" and Remi handles the rest.',
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
      a: 'The Free plan gives you 5 receipts per month. Pro unlocks unlimited receipts, all 4 premium PDF layouts, custom business logos, team member access, and priority support.',
    ),
    (
      q: 'How much does it cost?',
      a: 'Remi starts free. Pro is \$18/month or \$200/year. Localized pricing for certain regions is handled automatically at checkout.',
    ),
    (
      q: 'How do I cancel my subscription?',
      a: 'You can cancel anytime by messaging Remi in WhatsApp with the command "cancel subscription". Your Pro access remains until the end of your billing period.',
    ),
  ];

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

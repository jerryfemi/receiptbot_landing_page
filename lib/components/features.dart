import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class Features extends StatelessComponent {
  const Features({super.key});

  static const _features = [
    (
      icon: '💬',
      title: 'Chat Your Expenses',
      desc: 'Type the sale details naturally — "Sold 2 laptops to John for \$800" — and get a PDF. No forms, no apps.',
    ),
    (
      icon: '📈',
      title: 'Sales Stats',
      desc:
          'Get instant weekly, monthly, and yearly sales reports. Track your business growth directly in WhatsApp chat.',
    ),
    (
      icon: '📄',
      title: 'Beautiful PDF Invoices',
      desc:
          'Choose from 4 professional layouts. Classic, Modern, Minimal, or Signature — all branded to your business.',
    ),
    (
      icon: '🎨',
      title: 'Your Brand, Your Design',
      desc:
          'Upload your logo, set your colours, add your bank details. Every receipt looks like it came from your company.',
    ),
    (
      icon: '👥',
      title: 'Advanced Settings & Team',
      desc: 'Manage currency, team members, and business settings right from the chat menu.',
    ),
    (
      icon: '⚡',
      title: 'Instant Delivery',
      desc: 'Your invoice is ready in seconds and delivered right back into the same WhatsApp conversation.',
    ),
  ];

  @override
  Component build(BuildContext context) {
    return section(id: 'features', classes: 'section features-section', [
      div(classes: 'container', [
        div(classes: 'section-header reveal', [
          span(classes: 'section-label', [.text('What Remi Does')]),
          h2(classes: 'section-title', [.text('Everything you need,\nnone of the hassle')]),
          p(classes: 'section-sub center', [
            .text('Six powerful features baked right into your WhatsApp chat.'),
          ]),
        ]),
        div(classes: 'features-grid', [
          for (final f in _features)
            div(classes: 'feature-card reveal', [
              div(classes: 'feature-icon', [.text(f.icon)]),
              h3(classes: 'feature-title', [.text(f.title)]),
              p(classes: 'feature-desc', [.text(f.desc)]),
            ]),
        ]),
      ]),
    ]);
  }
}

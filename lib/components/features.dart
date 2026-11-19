import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class Features extends StatelessComponent {
  const Features({super.key});

  static const _items = [
    ('Your brand on every page', 'Logo, address, phone and bank details, set once in Settings.'),
    ('Invoices too', 'Due dates and where to pay, so customers know exactly what to send.'),
    ('It checks before it sends', 'Missing price or customer? Remi asks first instead of guessing.'),
    ('Your team can issue receipts', 'Add staff and their receipts come out under your business name.'),
    ('Sales totals on request', 'Ask for this week, this month or this year and get the numbers in chat.'),
    ('Any currency', 'Naira by default. Switch to cedis, dollars or anything else in Settings.'),
  ];

  @override
  Component build(BuildContext context) {
    return section(classes: 'band-white', [
      div(classes: 'wrap section-pad', [
        h2(classes: 'section-title section-title-sm', [.text('It does the boring parts properly.')]),
        div(classes: 'feature-grid', [
          for (final (title, text) in _items)
            div(classes: 'feature', [
              h3(classes: 'feature-title', [.text(title)]),
              p(classes: 'feature-text', [.text(text)]),
            ]),
        ]),
      ]),
    ]);
  }
}

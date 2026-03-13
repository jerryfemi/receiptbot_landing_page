import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class About extends StatelessComponent {
  const About({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'about', classes: 'section about-section', [
      div(classes: 'container about-inner', [
        div(classes: 'about-text reveal', [
          span(classes: 'section-label', [.text('About')]),
          h2(classes: 'section-title', [.text('Built out of a real problem')]),
          p(classes: 'about-p', [
            .text(
              'Remi started as a personal frustration — receipts scattered in wallets, '
              'photos buried in camera rolls, no clean record of what was spent. '
              'The solution turned out to be simpler than any app.',
            ),
          ]),
          p(classes: 'about-p', [
            .text(
              "WhatsApp is already on everyone's phone. Remi lives there. "
              "No download, no account — just send a receipt and get a PDF. "
              "Remi does the heavy lifting, you keep the clean records.",
            ),
          ]),
          div(classes: 'about-values', [
            _value('🧾', 'No paper trail left behind'),
            _value('📲', 'Lives in WhatsApp — no new app'),
            _value('🌍', 'Professional records, zero friction'),
            _value('📊', 'Weekly, monthly & yearly sales insights'),
          ]),
        ]),
        div(classes: 'about-visual reveal', [
          div(classes: 'about-card', [
            div(classes: 'about-quote', [
              .text('"The average person loses track of 30–40% of their monthly receipts."'),
            ]),
            p(classes: 'about-quote-credit', [.text('— The problem Remi solves')]),
          ]),
        ]),
      ]),
    ]);
  }

  Component _value(String icon, String label) {
    return div(classes: 'about-value', [
      span([.text(icon)]),
      .text(' $label'),
    ]);
  }
}

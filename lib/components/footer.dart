import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';

class Footer extends StatelessComponent {
  const Footer({super.key});

  @override
  Component build(BuildContext context) {
    return footer(classes: 'wrap site-footer', [
      span([.text('© ${DateTime.now().year} Remi. Receipts and invoices on WhatsApp.')]),
      div(classes: 'footer-links', [
        a(href: AppLinks.privacy, [.text('Privacy policy')]),
        a(href: AppLinks.supportEmail, [.text(AppLinks.supportEmailLabel)]),
        a(
          href: AppLinks.twitter,
          target: Target.blank,
          attributes: const {'rel': 'noopener noreferrer'},
          [.text('@receiptbot_remi on X')],
        ),
      ]),
    ]);
  }
}

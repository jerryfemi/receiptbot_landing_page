import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import '../constants/theme.dart';

class Footer extends StatelessComponent {
  const Footer({super.key});

  @override
  Component build(BuildContext context) {
    return footer(classes: 'site-footer', [
      div(classes: 'container footer-inner', [
        div(classes: 'footer-brand', [
          div(classes: 'footer-logo', [
            img(
              src: 'images/logo.png',
              classes: 'logo-icon-img',
              attributes: {'alt': 'Remi Logo'},
            ),
            span(classes: 'logo-text', [.text('Remi')]),
          ]),
          p(classes: 'footer-tagline', [
            .text('The WhatsApp receipt bot.\nSimple. Smart. Instant.'),
          ]),
          a(
            href: AppLinks.whatsapp,
            target: Target.blank,
            attributes: const {'rel': 'noopener noreferrer'},
            classes: 'btn-primary footer-cta',
            [.text('Start for Free →')],
          ),
        ]),
        div(classes: 'footer-links', [
          div(classes: 'footer-col', [
            span(classes: 'footer-col-title', [.text('Product')]),
            _link('#features', 'Features'),
            _link('#how-it-works', 'How It Works'),
            _link('#pricing', 'Pricing'),
          ]),
          div(classes: 'footer-col', [
            span(classes: 'footer-col-title', [.text('Company')]),
            _link('#about', 'About'),
            _link('#faq', 'FAQ'),
            _link('#contact', 'Contact'),
            _link(AppLinks.supportEmail, 'Support'),
          ]),
        ]),
        div(classes: 'footer-qr', [
          img(
            src: 'images/qr-code.png',
            classes: 'qr-image',
            attributes: {'alt': 'Remi WhatsApp QR Code'},
          ),
          p(classes: 'qr-sub', [.text('Opens Remi in WhatsApp')]),
        ]),
      ]),
      div(classes: 'footer-bottom', [
        div(classes: 'container footer-bottom-inner', [
          p([.text('© 2025 Remi. All rights reserved.')]),
          p([.text('Remi, professional receipts for the global entrepreneur.')]),
        ]),
      ]),
    ]);
  }

  Component _link(String href, String label) {
    return a(href: href, classes: 'footer-link', [.text(label)]);
  }
}

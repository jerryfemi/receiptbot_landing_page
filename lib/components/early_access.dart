import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import '../constants/theme.dart';

/// Replaces the early-access waitlist section.
/// Now a clean Premium CTA that drives users to WhatsApp.
class EarlyAccess extends StatelessComponent {
  const EarlyAccess({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'get-started', classes: 'section cta-section', [
      div(classes: 'container', [
        div(classes: 'cta-card reveal', [
          div(classes: 'cta-glow-orb', []),
          div(classes: 'cta-content', [
            span(classes: 'section-label', [.text('Get Started Today')]),
            h2(classes: 'cta-title', [
              .text('Your business deserves\nbetter receipts.'),
            ]),
            p(classes: 'cta-sub', [
              .text(
                'Join businesses already using Remi to generate '
                'professional invoices in seconds — right inside WhatsApp.',
              ),
            ]),
            div(classes: 'cta-actions', [
              a(
                href: AppLinks.whatsapp,
                target: Target.blank,
                classes: 'btn-primary cta-btn',
                [.text('Start for Free')],
              ),
              a(href: '#pricing', classes: 'btn-ghost cta-btn', [
                .text('See Pricing'),
              ]),
            ]),
            div(classes: 'cta-qr', [
              img(
                src: 'images/qr-code.png',
                classes: 'qr-image-small',
                attributes: {'alt': 'Remi WhatsApp QR Code'},
              ),
              span(classes: 'cta-qr-text', [.text('Scan to open in WhatsApp')]),
            ]),
          ]),
        ]),
      ]),
    ]);
  }
}

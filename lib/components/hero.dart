import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import '../constants/theme.dart';

class Hero extends StatelessComponent {
  const Hero({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'hero', classes: 'hero-section', [
      div(classes: 'hero-orb orb-1', []),
      div(classes: 'hero-orb orb-2', []),
      div(classes: 'container hero-inner', [
        div(classes: 'hero-text', [
          div(classes: 'hero-badge', [
            span(classes: 'badge-dot', []),
            .text('WhatsApp Receipt Bot'),
          ]),
          h1(classes: 'hero-headline', [
            .text('Generate Receipts.'),
            br(),
            span(classes: 'headline-accent', [.text('Just by Texting.')]),
          ]),
          p(classes: 'hero-sub', [
            .text(
              'Tell Remi what you sold and get a professional PDF receipt or invoice '
              'delivered to your WhatsApp in seconds. '
              'No app. No forms. No friction.',
            ),
          ]),
          div(classes: 'hero-cta-row', [
            a(
              href: AppLinks.whatsapp,
              target: Target.blank,
              classes: 'btn-primary',
              [
                .text(' Start for Free'),
              ],
            ),
            a(href: '#how-it-works', classes: 'btn-ghost', [
              .text('See How It Works'),
            ]),
          ]),
          div(classes: 'hero-stats', [
            _stat('5', 'Free invoices/month'),
            div(classes: 'stat-divider', []),
            _stat('4', 'PDF layouts'),
            div(classes: 'stat-divider', []),
            _stat('AI', 'Powered by Gemini'),
          ]),
        ]),
        div(classes: 'hero-visual', [
          div(classes: 'phone-frame', [
            video(
              src: 'images/First.webm',
              classes: 'demo-video',
              attributes: {'autoplay': 'true', 'loop': 'true', 'muted': 'true', 'playsinline': 'true'},
              [],
            ),
          ]),
          div(classes: 'phone-glow', []),
        ]),
      ]),
    ]);
  }

  Component _stat(String value, String label) {
    return div(classes: 'hero-stat', [
      span(classes: 'stat-value', [.text(value)]),
      span(classes: 'stat-label', [.text(label)]),
    ]);
  }
}

import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';

/// Headline on the left; on the right a real chat with Remi that plays
/// once, and the receipt it sent landing beside it.
class Hero extends StatelessComponent {
  const Hero({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'top', classes: 'wrap hero', [
      div(classes: 'hero-copy', [
        h1(classes: 'hero-title', [.text('Text the sale.'), br(), .text('Get the receipt.')]),
        p(classes: 'hero-sub', [
          .text(
            'Tell Remi what you sold on WhatsApp and a clean PDF receipt or '
            'invoice comes back in seconds, with your name, logo and bank '
            'details on it.',
          ),
        ]),
        div(classes: 'btn-row', [
          a(
            href: AppLinks.whatsapp,
            target: Target.blank,
            attributes: const {'rel': 'noopener noreferrer'},
            classes: 'btn btn-solid',
            [.text('Start on WhatsApp')],
          ),
          a(href: '#layouts', classes: 'btn btn-line', [.text('See the four layouts')]),
        ]),
        p(classes: 'mono-note', [
          .text('Free for $freeReceiptsPerMonth receipts a month. Nothing to download.'),
        ]),
      ]),
      div(classes: 'hero-demo', [
        div(classes: 'real-demo', [
          div(classes: 'real-chat', [
            video(
              [],
              attributes: const {
                'src': 'images/real/chat-typed.mp4',
                'poster': 'images/real/chat-typed-poster.jpg',
                'autoplay': '',
                'muted': '',
                'playsinline': '',
                'preload': 'auto',
                'width': '750',
                'height': '694',
                'aria-label': 'A WhatsApp chat: "Sold 5 cartons of Indomie to Chidi for '
                    '9,500 each". Remi replies with a PDF receipt.',
              },
            ),
          ]),
          div(classes: 'real-receipt', [
            img(
              src: 'images/real/receipt-chidi.webp',
              alt: 'The receipt Remi sent: Chidi, 5 cartons of Indomie, ₦47,500, paid.',
              attributes: const {'width': '720', 'height': '1018'},
            ),
          ]),
        ]),
      ]),
    ]);
  }
}

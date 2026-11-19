import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';

class Closing extends StatelessComponent {
  const Closing({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'band-blue', [
      div(classes: 'wrap closing', [
        div(classes: 'closing-copy', [
          h2(classes: 'closing-title', [.text('Your next sale deserves a proper receipt.')]),
          a(
            href: AppLinks.whatsapp,
            target: Target.blank,
            attributes: const {'rel': 'noopener noreferrer'},
            classes: 'btn btn-white',
            [.text('Start on WhatsApp')],
          ),
        ]),
        div(classes: 'qr', [
          div(classes: 'qr-box', [
            img(
              src: 'images/qr.png',
              alt: 'QR code that opens Remi in WhatsApp',
              attributes: const {'width': '132', 'height': '132', 'loading': 'lazy'},
            ),
          ]),
          p(classes: 'qr-text', [.text('Scan with your phone camera to open Remi.')]),
        ]),
      ]),
    ]);
  }
}

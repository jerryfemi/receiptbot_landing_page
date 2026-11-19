import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';

class Navbar extends StatelessComponent {
  const Navbar({super.key});

  @override
  Component build(BuildContext context) {
    return header(classes: 'site-header', [
      nav(classes: 'wrap nav', attributes: const {'aria-label': 'Main'}, [
        a(href: '#top', classes: 'brand', [
          img(
            src: 'images/remi-face.webp',
            alt: '',
            classes: 'brand-mark',
            attributes: const {'width': '32', 'height': '32'},
          ),
          span(classes: 'brand-name', [.text('Remi')]),
        ]),
        div(classes: 'nav-links', [
          a(href: '#how', classes: 'nav-link', [.text('How it works')]),
          a(href: '#layouts', classes: 'nav-link', [.text('Layouts')]),
          a(href: '#pricing', classes: 'nav-link', [.text('Pricing')]),
          a(href: '#faq', classes: 'nav-link', [.text('Questions')]),
          a(
            href: AppLinks.whatsapp,
            target: Target.blank,
            attributes: const {'rel': 'noopener noreferrer'},
            classes: 'btn btn-solid btn-small',
            [.text('Open in WhatsApp')],
          ),
        ]),
      ]),
    ]);
  }
}

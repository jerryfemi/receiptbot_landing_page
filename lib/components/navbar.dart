import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import '../constants/theme.dart';

class Navbar extends StatelessComponent {
  const Navbar({super.key});

  @override
  Component build(BuildContext context) {
    return nav(classes: 'navbar', [
      div(classes: 'container nav-inner', [
        a(href: '#', classes: 'nav-logo', [
          img(
            src: 'images/logo.png',
            classes: 'logo-icon-img',
            attributes: {'alt': 'Remi Logo'},
          ),
          span(classes: 'logo-text', [.text('Remi')]),
        ]),
        ul(classes: 'nav-links', [
          _navLink('#features', 'Features'),
          _navLink('#how-it-works', 'How It Works'),
          _navLink('#pricing', 'Pricing'),
          _navLink('#faq', 'FAQ'),
          _navLink('#about', 'About'),
          _navLink('#contact', 'Contact'),
        ]),
        a(
          href: AppLinks.whatsapp,
          target: Target.blank,
          classes: 'btn-primary nav-cta',
          [.text('Get Started →')],
        ),
      ]),
    ]);
  }

  Component _navLink(String href, String label) {
    return li([
      a(href: href, classes: 'nav-link', [.text(label)]),
    ]);
  }
}

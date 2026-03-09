import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import 'components/navbar.dart';
import 'components/hero.dart';
import 'components/features.dart';
import 'components/how_it_works.dart';
import 'components/pricing.dart';
import 'components/early_access.dart';
import 'components/showcase.dart';
import 'components/faq.dart';
import 'components/about.dart';
import 'components/contact.dart';
import 'components/footer.dart';

@client
class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'remi-app', [
      const Navbar(),
      main_([
        const Hero(),
        const About(),
        const Features(),
        const HowItWorks(),
        const Showcase(),
        const EarlyAccess(),
        const Pricing(),
        const Faq(),
        const Contact(),
      ]),
      const Footer(),
    ]);
  }
}

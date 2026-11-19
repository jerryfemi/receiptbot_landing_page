import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import 'components/closing.dart';
import 'components/faq.dart';
import 'components/features.dart';
import 'components/footer.dart';
import 'components/hero.dart';
import 'components/how_it_works.dart';
import 'components/layouts.dart';
import 'components/navbar.dart';
import 'components/pricing.dart';

@client
class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'page', [
      const Navbar(),
      main_([
        const Hero(),
        const HowItWorks(),
        const Layouts(),
        const Features(),
        const Pricing(),
        const Faq(),
        const Closing(),
      ]),
      const Footer(),
    ]);
  }
}

/// Server entry point — pre-renders the page as static HTML.
library;

import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';

import 'app.dart';
import 'main.server.options.dart';

void main() {
  Jaspr.initializeApp(options: defaultServerOptions);

  runApp(
    Document(
      title: 'Remi: receipts and invoices on WhatsApp',
      meta: {
        'description':
            'Tell Remi what you sold on WhatsApp and get a clean PDF receipt or '
            'invoice back in seconds, with your logo and bank details on it.',
        'theme-color': '#F2F2EE',
      },
      styles: [
        css.import('styles.css'),
      ],
      head: [
        link(rel: 'apple-touch-icon', href: 'images/apple-touch-icon.png'),
        link(rel: 'preconnect', href: 'https://fonts.googleapis.com'),
        link(
          href: 'https://fonts.googleapis.com/css2?family=Bricolage+Grotesque:opsz,wght@12..96,400;12..96,500;12..96,600;12..96,700;12..96,800'
              '&family=JetBrains+Mono:wght@400;700;800&display=swap',
          rel: 'stylesheet',
        ),
      ],
      body: App(),
    ),
  );
}

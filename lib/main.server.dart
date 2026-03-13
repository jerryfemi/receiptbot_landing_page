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
      title: 'Remi — The WhatsApp Receipt Bot',
      meta: {
        'description':
            'Remi is the AI-powered WhatsApp bot that reads your receipts, '
            'generates beautiful PDFs, and keeps your spending organised. '
            'No app needed.',
        'theme-color': '#0A0F1E',
      },
      styles: [
        // Link our external stylesheet
        css.import('styles.css'),
      ],
      head: [
        // Load fonts efficiently
        link(href: 'https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800;900&display=swap', rel: 'stylesheet'),
        // Scroll reveal + navbar shadow on scroll
        script(src: 'app.js', attributes: {'defer': ''}),
      ],
      body: App(),
    ),
  );
}

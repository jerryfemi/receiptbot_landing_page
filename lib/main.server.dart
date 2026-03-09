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
        // Scroll reveal + navbar shadow on scroll
        Component.element(
          tag: 'script',
          children: [
            Component.text(r'''document.addEventListener('DOMContentLoaded', function() {
  var reveals = document.querySelectorAll('.reveal');
  var io = new IntersectionObserver(function(entries) {
    entries.forEach(function(e) {
      if (e.isIntersecting) e.target.classList.add('visible');
    });
  }, { threshold: 0.1 });
  reveals.forEach(function(el) { io.observe(el); });

  var nav = document.querySelector('.navbar');
  if (nav) {
    window.addEventListener('scroll', function() {
      nav.style.boxShadow = window.scrollY > 40
        ? '0 4px 40px rgba(0,0,0,0.5)' : 'none';
    });
  }
});'''),
          ],
        ),
      ],
      body: App(),
    ),
  );
}

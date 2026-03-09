import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import '../constants/theme.dart';

class Contact extends StatelessComponent {
  const Contact({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'contact', classes: 'section contact-section', [
      div(classes: 'container', [
        div(classes: 'section-header reveal', [
          span(classes: 'section-label', [.text('Contact & Support')]),
          h2(classes: 'section-title', [.text("We're here to help")]),
          p(classes: 'section-sub center', [
            .text("Got a question or issue? Reach out — we respond fast."),
          ]),
        ]),
        div(classes: 'contact-cards', [
          _card(
            '💬',
            'WhatsApp Support',
            'Message us directly on WhatsApp. Usually reply within a few hours.',
            AppLinks.whatsapp,
            'Chat with Support',
            true,
          ),
          _card(
            '📧',
            'Email',
            "Prefer email? Drop us a message and we'll get back to you.",
            AppLinks.supportEmail,
            'Send an Email',
            true,
          ),
          _card(
            '📖',
            'How-To Guide',
            'Check the How It Works section for a full walkthrough of all features.',
            '#how-it-works',
            'Read the Guide',
            false,
          ),
        ]),
      ]),
    ]);
  }

  Component _card(String icon, String title, String desc, String link, String linkText, bool external) {
    return div(classes: 'contact-card reveal', [
      span(classes: 'contact-icon', [.text(icon)]),
      h3(classes: 'contact-title', [.text(title)]),
      p(classes: 'contact-desc', [.text(desc)]),
      a(
        href: link,
        target: external ? Target.blank : Target.self,
        classes: 'contact-link',
        [.text('$linkText →')],
      ),
    ]);
  }
}

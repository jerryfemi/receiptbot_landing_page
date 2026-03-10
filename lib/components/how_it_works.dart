import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class HowItWorks extends StatelessComponent {
  const HowItWorks({super.key});

  static const _commands = [
    (
      icon: '✏️',
      title: 'Edit Profile',
      desc: 'Set your business name, address, phone, and bank details — reflected on every PDF you generate.',
    ),
    (
      icon: '🎨',
      title: 'Customise Receipts',
      desc: 'Pick a PDF layout structure and colour theme to match your brand. Upload your business logo too.',
    ),
    (
      icon: '👥',
      title: 'Manage Team',
      desc: 'Invite or remove staff members so they can generate receipts under your business profile.',
    ),
    (
      icon: '💱',
      title: 'Change Currency',
      desc: 'Switch your default currency at any time. Remi works with any currency, anywhere in the world.',
    ),
    (
      icon: '📊',
      title: 'Subscription Status',
      desc: 'Check your current plan, how many receipts you\'ve used this month, and your next renewal date.',
    ),
    (
      icon: '💬',
      title: 'Help & Support',
      desc: 'Access the full usage guide or reach the support team directly from inside the WhatsApp chat.',
    ),
  ];

  @override
  Component build(BuildContext context) {
    return section(id: 'how-it-works', classes: 'section hiw-section', [
      div(classes: 'container', [
        // ── Part A: Core Loop ──
        div(classes: 'section-header reveal', [
          span(classes: 'section-label', [.text('How It Works')]),
          h2(classes: 'section-title', [.text('Up and running in 30 seconds')]),
          p(classes: 'section-sub center', [
            .text('Three simple steps. No installs. No signups. Just WhatsApp.'),
          ]),
        ]),
        div(classes: 'hiw-steps', [
          _stepVideo(
            '01',
            'Start the Bot',
            'Tap "Get Started" or scan the QR code to open Remi in WhatsApp. '
                'Send a quick hello to set your business name and you\'re ready to go.',
            'Onboarding.webm',
            false,
          ),
          _stepVideo(
            '02',
            'Tell Remi the Sale',
            'Type what you sold in plain English — '
                '"Sold 5 T-shirts to John for \$150". '
                'Or upload a photo of a handwritten note. Remi reads both.',
            'Receipt.webm',
            true,
          ),
          _stepImg(
            '03',
            'Receive Your PDF',
            'Your branded receipt or invoice arrives in the same chat in seconds. '
                'Download it, forward it to your client, or archive it — the choice is yours.',
            'receipt.png',
            false,
          ),
        ]),

        // ── Part B: Commands Grid ──
        div(classes: 'commands-header reveal', [
          h3(classes: 'commands-title', [.text('Advanced Features')]),
          p(classes: 'commands-sub', [
            .text('Everything you can do by tapping '),
            strong([.text('Settings')]),
            .text(' inside the bot.'),
          ]),
        ]),
        div(classes: 'commands-grid', [
          for (final c in _commands)
            div(classes: 'command-card reveal', [
              span(classes: 'command-icon', [.text(c.icon)]),
              h4(classes: 'command-title', [.text(c.title)]),
              p(classes: 'command-desc', [.text(c.desc)]),
            ]),
        ]),
      ]),
    ]);
  }

  Component _stepVideo(String num, String title, String desc, String videoFilename, bool flip) {
    return div(classes: 'hiw-row reveal${flip ? ' hiw-row--flip' : ''}', [
      div(classes: 'hiw-text', [
        span(classes: 'hiw-num', [.text(num)]),
        h3(classes: 'hiw-title', [.text(title)]),
        p(classes: 'hiw-desc', [.text(desc)]),
      ]),
      div(classes: 'hiw-media', [
        video(
          src: 'images/$videoFilename',
          classes: 'step-video',
          attributes: {'autoplay': 'true', 'loop': 'true', 'muted': 'true', 'playsinline': 'true'},
          [],
        ),
      ]),
    ]);
  }

  Component _stepImg(String num, String title, String desc, String filename, bool flip) {
    return div(classes: 'hiw-row reveal${flip ? ' hiw-row--flip' : ''}', [
      div(classes: 'hiw-text', [
        span(classes: 'hiw-num', [.text(num)]),
        h3(classes: 'hiw-title', [.text(title)]),
        p(classes: 'hiw-desc', [.text(desc)]),
      ]),
      div(classes: 'hiw-media', [
        img(
          src: 'images/$filename',
          classes: 'step-video',
          attributes: {'alt': title},
        ),
      ]),
    ]);
  }
}

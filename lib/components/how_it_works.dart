import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// The three steps, printed down one long till slip.
class HowItWorks extends StatelessComponent {
  const HowItWorks({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'how', classes: 'band-dark', [
      div(classes: 'wrap split', [
        div(classes: 'split-intro', [
          h2(classes: 'section-title', [.text('Three messages, one receipt.')]),
          p(classes: 'section-sub on-dark', [
            .text('No forms, no app, no account to make. If you can send a '
                'WhatsApp message, you can use Remi.'),
          ]),
        ]),
        div(classes: 'split-main', [
          div(classes: 'zig-top', []),
          ol(classes: 'roll', [
            _step(
              '01',
              'Say hello on WhatsApp',
              [
                p(classes: 'step-text', [
                  .text("Open Remi and tell it your business name. That's the whole "
                      'setup. Add your logo and bank details whenever you like.'),
                ]),
              ],
            ),
            _step(
              '02',
              'Tell it what you sold',
              [
                p(classes: 'step-text', [
                  .text("Type it the way you'd say it, snap a handwritten note, or "
                      'just send a voice note.'),
                ]),
                div(classes: 'ways', [
                  _way('chat-typed.webp', 'Type it', 'A typed message about selling Indomie to Chidi, and the PDF Remi sent back'),
                  _way('chat-voice.webp', 'Say it', 'A voice note, and the PDF receipt for Tunde that Remi sent back'),
                  _way('chat-photo.webp', 'Snap it', "A photo of Mama Ngozi's handwritten list, and the PDF Remi sent back"),
                ]),
              ],
            ),
            _step(
              '03',
              'Get the PDF back',
              [
                p(classes: 'step-text', [
                  .text('It lands in the same chat in seconds, ready to forward to '
                      'your customer. Spot a mistake? Tap Fix it and say what to change.'),
                ]),
              ],
            ),
          ]),
          div(classes: 'zig-bottom', []),
        ]),
      ]),
    ]);
  }

  Component _way(String file, String label, String alt) {
    return figure(classes: 'way', [
      img(src: 'images/real/$file', alt: alt, attributes: const {'loading': 'lazy'}),
      figcaption([.text(label)]),
    ]);
  }

  Component _step(String number, String title, List<Component> body) {
    return li(classes: 'step', [
      span(classes: 'step-num', [.text(number)]),
      div(classes: 'step-body', [
        h3(classes: 'step-title', [.text(title)]),
        ...body,
      ]),
    ]);
  }
}

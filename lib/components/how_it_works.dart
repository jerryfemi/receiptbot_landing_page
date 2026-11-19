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
                div(classes: 'examples', [
                  span(classes: 'example mono', [.text('sold 3 shirts to Bola, 7k each')]),
                  span(classes: 'example', [
                    img(src: 'images/icons/mic.svg', alt: '', attributes: const {'width': '16', 'height': '16'}),
                    img(
                      src: 'images/icons/wave.svg',
                      alt: 'A voice note',
                      attributes: const {'width': '96', 'height': '18'},
                    ),
                    span(classes: 'mono muted-small', [.text('0:06')]),
                  ]),
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

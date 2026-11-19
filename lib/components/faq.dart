import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class Faq extends StatefulComponent {
  const Faq({super.key});

  @override
  State<Faq> createState() => _FaqState();
}

const _questions = [
  (
    'Do I need to download anything?',
    'No. Remi lives in WhatsApp. Tap Start on WhatsApp or scan the code, say hello, and you are set up.',
  ),
  (
    'Can it read handwriting or voice notes?',
    'Yes. Send a photo of a handwritten sales note or record a voice note describing the sale. '
        'Typing works too, the way you would say it to a friend.',
  ),
  (
    'What if a receipt comes out wrong?',
    'Tap Fix it under the receipt and say what to change, like "the price was 40k". Remi sends a '
        'corrected copy. If something is missing before it sends, it asks you first.',
  ),
  (
    'Is my business data shared with anyone?',
    'No. Your sales are used to make your receipts and your own totals, and nothing else. '
        'The privacy policy has the details.',
  ),
  (
    'How do I pay for Pro, and can I cancel?',
    'You upgrade from inside the chat. Pro runs until the end of the period you paid for, '
        'and you can stop renewing any time.',
  ),
];

class _FaqState extends State<Faq> {
  int _open = 0;

  @override
  Component build(BuildContext context) {
    return section(id: 'faq', classes: 'band-white', [
      div(classes: 'wrap-narrow section-pad', [
        h2(classes: 'section-title section-title-sm', [.text('Questions people ask.')]),
        div(classes: 'faq-list', [
          for (var i = 0; i < _questions.length; i++) _item(i),
        ]),
      ]),
    ]);
  }

  Component _item(int i) {
    final (question, answer) = _questions[i];
    final open = _open == i;
    return div(classes: 'faq-item', [
      button(
        classes: 'faq-q',
        attributes: {'type': 'button', 'aria-expanded': '$open'},
        onClick: () => setState(() => _open = open ? -1 : i),
        [
          span([.text(question)]),
          span(classes: 'faq-sign', attributes: const {'aria-hidden': 'true'}, [.text(open ? '−' : '+')]),
        ],
      ),
      if (open) p(classes: 'faq-a', [.text(answer)]),
    ]);
  }
}

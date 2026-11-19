import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// "Pick your paper": the four receipt layouts fanned out on a desk.
/// Choosing one from the list brings it to the front.
class Layouts extends StatefulComponent {
  const Layouts({super.key});

  @override
  State<Layouts> createState() => _LayoutsState();
}

class _Paper {
  const _Paper(this.id, this.name, this.blurb, this.plan);
  final String id;
  final String name;
  final String blurb;
  final String plan;
}

const _papers = [
  _Paper('studio', 'Studio', 'Bold and modern, with a coloured sidebar.', 'FREE PLAN'),
  _Paper('signature', 'Signature', 'Ivory page, script title, a wax-seal stamp.', 'PRO'),
  _Paper('market', 'Market', 'A carbon-copy sales book with a rubber stamp.', 'PRO'),
  _Paper('till', 'Till', 'A till slip with a scannable QR code.', 'PRO'),
];

/// Where each paper sits when it isn't picked: (sideways %, down px, tilt°).
const _fan = [(-62, 70, -9), (-21, 50, -3), (21, 50, 3), (62, 70, 9)];

class _LayoutsState extends State<Layouts> {
  int _picked = 0;

  @override
  Component build(BuildContext context) {
    return section(id: 'layouts', classes: 'wrap split split-center section-pad', [
      div(classes: 'split-intro', [
        h2(classes: 'section-title', [.text('Pick your paper.')]),
        p(classes: 'section-sub', [
          .text('Four layouts, each with a receipt and an invoice version. '
              'Change yours any time from Settings.'),
        ]),
        div(classes: 'paper-list', [
          for (var i = 0; i < _papers.length; i++) _option(i),
        ]),
      ]),
      div(classes: 'split-main', [
        div(classes: 'desk', [
          for (var i = 0; i < _papers.length; i++) _paperImage(i),
        ]),
      ]),
    ]);
  }

  Component _option(int i) {
    final paper = _papers[i];
    final picked = i == _picked;
    return button(
      classes: 'paper-option${picked ? ' paper-option--picked' : ''}',
      attributes: {'type': 'button', 'aria-pressed': '$picked'},
      onClick: () => setState(() => _picked = i),
      [
        span(classes: 'paper-text', [
          span(classes: 'paper-name', [.text(paper.name)]),
          span(classes: 'paper-blurb', [.text(paper.blurb)]),
        ]),
        span(classes: 'paper-plan', [.text(paper.plan)]),
      ],
    );
  }

  Component _paperImage(int i) {
    final paper = _papers[i];
    final picked = i == _picked;
    final (x, y, tilt) = _fan[i];
    final transform = picked
        ? 'translateX(-50%) scale(1.08)'
        : 'translateX(-50%) translateX($x%) translateY(${y}px) rotate(${tilt}deg) scale(0.9)';
    return img(
      src: 'images/layouts/${paper.id}.webp',
      alt: '${paper.name} layout receipt',
      classes: 'paper${picked ? ' paper--picked' : ''}',
      attributes: {
        'loading': 'lazy',
        'style': 'transform: $transform; z-index: ${picked ? 10 : i + 1}',
      },
    );
  }
}

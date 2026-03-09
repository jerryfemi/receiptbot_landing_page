import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class Showcase extends StatelessComponent {
  const Showcase({super.key});

  static const _items = [
    (img: 'images/hello.png', caption: 'Seamless chat interface'),
    (img: 'images/menu.png', caption: 'Interactive WhatsApp menus'),
    (img: 'images/edit_profile.png', caption: 'Easy profile management'),
    (img: 'images/receipt.png', caption: 'Professional PDF receipts'),
  ];

  @override
  Component build(BuildContext context) {
    return section(id: 'showcase', classes: 'section showcase-section', [
      div(classes: 'container', [
        div(classes: 'section-header reveal', [
          span(classes: 'section-label', [.text('Sneak Peek')]),
          h2(classes: 'section-title', [.text('See Remi in action')]),
          p(classes: 'section-sub center', [
            .text('Real screenshots from a real WhatsApp conversation.'),
          ]),
        ]),
        div(classes: 'showcase-scroll-wrapper', [
          div(classes: 'showcase-track', [
            for (final item in _items)
              div(classes: 'showcase-frame reveal', [
                div(classes: 'frame-inner', [
                  img(
                    src: item.img,
                    alt: item.caption,
                    classes: 'showcase-img',
                  ),
                ]),
                p(classes: 'frame-caption', [.text(item.caption)]),
              ]),
          ]),
        ]),
      ]),
    ]);
  }
}

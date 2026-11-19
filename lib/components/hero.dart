import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';

/// Headline on the left; on the right a chat that plays out once, and a
/// till slip that prints out under it and gets stamped PAID.
class Hero extends StatelessComponent {
  const Hero({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'top', classes: 'wrap hero', [
      div(classes: 'hero-copy', [
        h1(classes: 'hero-title', [.text('Text the sale.'), br(), .text('Get the receipt.')]),
        p(classes: 'hero-sub', [
          .text(
            'Tell Remi what you sold on WhatsApp and a clean PDF receipt or '
            'invoice comes back in seconds, with your name, logo and bank '
            'details on it.',
          ),
        ]),
        div(classes: 'btn-row', [
          a(
            href: AppLinks.whatsapp,
            target: Target.blank,
            attributes: const {'rel': 'noopener noreferrer'},
            classes: 'btn btn-solid',
            [.text('Start on WhatsApp')],
          ),
          a(href: '#layouts', classes: 'btn btn-line', [.text('See the four layouts')]),
        ]),
        p(classes: 'mono-note', [
          .text('Free for $freeReceiptsPerMonth receipts a month. Nothing to download.'),
        ]),
      ]),
      div(classes: 'hero-demo', [
        div(classes: 'demo', [
          div(classes: 'chat', [
            div(classes: 'chat-head', [
              img(
                src: 'images/remi-face.webp',
                alt: '',
                classes: 'chat-avatar',
                attributes: const {'width': '36', 'height': '36'},
              ),
              div(classes: 'chat-who', [
                span(classes: 'chat-name', [.text('Remi')]),
                span(classes: 'chat-status', [.text('online')]),
              ]),
            ]),
            div(classes: 'bubble bubble-me', [.text('sold 2 bags of rice to Tunde, 45k each')]),
            div(classes: 'typing', attributes: const {'aria-hidden': 'true'}, [span([]), span([]), span([])]),
            div(classes: 'bubble bubble-remi', [.text('Done. Receipt R-40171 for Tunde, ₦90,000.')]),
            div(classes: 'attachment', [
              img(src: 'images/icons/pdf.svg', alt: '', attributes: const {'width': '22', 'height': '22'}),
              span(classes: 'attachment-text', [
                span(classes: 'attachment-name', [.text('Receipt_R-40171.pdf')]),
                span(classes: 'attachment-meta', [.text('1 page, Till layout')]),
              ]),
            ]),
          ]),
          div(classes: 'printer', [
            div(classes: 'printer-slot', attributes: const {'aria-hidden': 'true'}, []),
            div(classes: 'printer-paper', [
              div(classes: 'slip slip-print', [
                div(classes: 'slip-body', [
                  span(classes: 'slip-shop', [.text('MAMA T PROVISIONS')]),
                  span(classes: 'slip-muted slip-center', [.text('WUSE MARKET, ABUJA')]),
                  span(classes: 'slip-dash', []),
                  span([.text('NO  R-40171')]),
                  span([.text('CUST TUNDE')]),
                  span(classes: 'slip-dash', []),
                  span(classes: 'slip-bold', [.text('RICE 50KG BAG')]),
                  span(classes: 'slip-line', [
                    span(classes: 'slip-muted', [.text('  2 x 45,000')]),
                    span([.text('90,000')]),
                  ]),
                  span(classes: 'slip-double', []),
                  span(classes: 'slip-line slip-total', [
                    span([.text('TOTAL NGN')]),
                    span(classes: 'slip-total-amount', [.text('90,000')]),
                  ]),
                  div(classes: 'slip-stamp-row', [span(classes: 'stamp stamp-land', [.text('PAID')])]),
                ]),
                div(classes: 'zig-bottom', []),
              ]),
            ]),
          ]),
        ]),
      ]),
    ]);
  }
}

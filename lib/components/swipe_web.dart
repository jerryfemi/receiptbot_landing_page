import 'dart:js_interop';

/// The horizontal position of a pointer event, in CSS pixels.
double? pointerX(Object event) {
  try {
    return (event as _PointerEvent).clientX;
  } catch (_) {
    return null;
  }
}

extension type _PointerEvent(JSObject _) implements JSObject {
  external double get clientX;
}

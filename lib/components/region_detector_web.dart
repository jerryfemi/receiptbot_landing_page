import 'dart:js_interop';

/// JS interop to get user's timezone
@JS('Intl.DateTimeFormat')
external JSObject _dateTimeFormat();

extension on JSObject {
  external JSObject resolvedOptions();
}

@JS()
extension type _ResolvedOptions(JSObject _) implements JSObject {
  external String get timeZone;
}

/// Check if user is in Africa based on their timezone.
/// African timezones all start with "Africa/" (e.g., Africa/Lagos, Africa/Nairobi).
bool isAfricanRegion() {
  try {
    final format = _dateTimeFormat();
    final options = format.resolvedOptions() as _ResolvedOptions;
    final timezone = options.timeZone;
    return timezone.startsWith('Africa/');
  } catch (_) {
    return false; // Default to USD if detection fails
  }
}

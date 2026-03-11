/// Stub implementation for server-side rendering.
/// On the server, we default to non-African (USD) pricing.
/// The client will re-render with the correct region on hydration.
bool isAfricanRegion() => false;

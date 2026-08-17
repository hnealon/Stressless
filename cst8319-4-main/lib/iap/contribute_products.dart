/// App Store Connect / Play product IDs for Contribute (consumable).
class ContributeProducts {
  static const List<int> amounts = [5, 10, 25, 50, 100];

  /// $50 uses `.50a` because `.50` was already consumed on the Apple team.
  static String idFor(int amount) {
    if (amount == 50) return 'com.stressless.app.contribute.50a';
    return 'com.stressless.app.contribute.$amount';
  }

  static final Set<String> ids = {for (final amount in amounts) idFor(amount)};
}

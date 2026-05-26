import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Why StateProvider is used:
/// StateProvider is a provider that exposes a way to modify its state.
/// It is ideal for simple pieces of state that can be directly changed
/// from the UI (like a counter, a boolean toggle, or a string search query).
/// For more complex logic, StateNotifierProvider or AsyncNotifierProvider would be preferred.
final counterProvider = StateProvider<int>((ref) {
  return 0; // Initial value
});

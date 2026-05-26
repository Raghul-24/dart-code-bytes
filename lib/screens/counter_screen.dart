import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/counter_provider.dart';

/// How ConsumerWidget rebuilds UI:
/// CounterScreen extends ConsumerWidget instead of StatelessWidget.
/// The build method takes an extra WidgetRef argument, which allows
/// it to listen to providers. When the state inside a watched provider
/// changes, ConsumerWidget triggers a rebuild of only the widgets that
/// are listening, ensuring efficient UI updates.
class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch(counterProvider) listens to the provider and rebuilds the widget
    // whenever the state changes.
    final count = ref.watch(counterProvider);

    // TextEditingController for the custom value input
    final textController = TextEditingController(text: count.toString());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Counter'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Current Counter Value',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Text(
                '$count',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              const SizedBox(height: 48),
              
              // Buttons Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _CounterButton(
                    icon: Icons.remove,
                    label: 'Decrement',
                    onPressed: () {
                      if (count > 0) {
                        ref.read(counterProvider.notifier).state--;
                      } else {
                        _showError(context, 'Value cannot be negative');
                      }
                    },
                  ),
                  const SizedBox(width: 16),
                  _CounterButton(
                    icon: Icons.refresh,
                    label: 'Reset',
                    onPressed: () {
                      ref.read(counterProvider.notifier).state = 0;
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Counter has been reset to 0'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    color: Colors.orange,
                  ),
                  const SizedBox(width: 16),
                  _CounterButton(
                    icon: Icons.add,
                    label: 'Increment',
                    onPressed: () {
                      ref.read(counterProvider.notifier).state++;
                    },
                  ),
                ],
              ),
              
              const SizedBox(height: 48),
              
              // Custom Value Input
              SizedBox(
                width: 200,
                child: TextField(
                  controller: textController,
                  decoration: const InputDecoration(
                    labelText: 'Set Custom Value',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.edit),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onSubmitted: (value) {
                    final newValue = int.tryParse(value);
                    if (newValue != null) {
                      ref.read(counterProvider.notifier).state = newValue;
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}

class _CounterButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color? color;

  const _CounterButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final themeColor = color ?? Theme.of(context).colorScheme.primary;
    
    return Tooltip(
      message: label,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: themeColor,
          foregroundColor: Colors.white,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20),
        ),
        child: Icon(icon),
      ),
    );
  }
}

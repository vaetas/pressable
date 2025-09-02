import 'package:flutter/material.dart';
import 'package:pressable/pressable.dart';

/// Demo page showcasing the pointer coordination features
class CoordinationDemo extends StatefulWidget {
  const CoordinationDemo({super.key});

  @override
  State<CoordinationDemo> createState() => _CoordinationDemoState();
}

class _CoordinationDemoState extends State<CoordinationDemo> {
  int _scalePressed = 0;
  int _opacityPressed = 0;
  int _builderPressed = 0;
  String _lastAction = 'None';
  bool _coordinationEnabled = true;
  bool _debugLogging = false;
  double _debounceMs = 50;
  double _timeoutSeconds = 3;

  @override
  void initState() {
    super.initState();
    _updateConfiguration();
  }

  void _updateConfiguration() {
    PressableCoordinator.instance.updateConfig(
      PressableCoordinationConfig(
        enabled: _coordinationEnabled,
        debounceTimeout: Duration(milliseconds: _debounceMs.round()),
        stuckStateTimeout: Duration(seconds: _timeoutSeconds.round()),
        allowSameTypeSimultaneous: false,
        debugLogging: _debugLogging,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pointer Coordination Demo'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Configuration Panel
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Configuration',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 12),
                    SwitchListTile(
                      title: const Text('Coordination Enabled'),
                      subtitle: const Text('Enable/disable multi-input coordination'),
                      value: _coordinationEnabled,
                      onChanged: (value) {
                        setState(() {
                          _coordinationEnabled = value;
                          _updateConfiguration();
                        });
                      },
                    ),
                    SwitchListTile(
                      title: const Text('Debug Logging'),
                      subtitle: const Text('Enable console debug output'),
                      value: _debugLogging,
                      onChanged: (value) {
                        setState(() {
                          _debugLogging = value;
                          _updateConfiguration();
                        });
                      },
                    ),
                    ListTile(
                      title: const Text('Debounce Timeout'),
                      subtitle: Text('${_debounceMs.round()}ms'),
                      trailing: SizedBox(
                        width: 200,
                        child: Slider(
                          value: _debounceMs,
                          min: 0,
                          max: 500,
                          divisions: 20,
                          onChanged: (value) {
                            setState(() {
                              _debounceMs = value;
                              _updateConfiguration();
                            });
                          },
                        ),
                      ),
                    ),
                    ListTile(
                      title: const Text('Stuck State Timeout'),
                      subtitle: Text('${_timeoutSeconds.round()}s'),
                      trailing: SizedBox(
                        width: 200,
                        child: Slider(
                          value: _timeoutSeconds,
                          min: 1,
                          max: 10,
                          divisions: 9,
                          onChanged: (value) {
                            setState(() {
                              _timeoutSeconds = value;
                              _updateConfiguration();
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Status Panel
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Status',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 12),
                    Text('Scale pressed: $_scalePressed times'),
                    Text('Opacity pressed: $_opacityPressed times'),
                    Text('Builder pressed: $_builderPressed times'),
                    Text('Last action: $_lastAction'),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _scalePressed = 0;
                          _opacityPressed = 0;
                          _builderPressed = 0;
                          _lastAction = 'Reset';
                        });
                      },
                      child: const Text('Reset Counters'),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Test Instructions
            Card(
              color: Colors.amber.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Testing Instructions',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '1. Try pressing multiple buttons simultaneously with different input types\n'
                      '2. Test with mouse clicks while touching other buttons\n'
                      '3. Observe how coordination prevents conflicts\n'
                      '4. Disable coordination to see the difference\n'
                      '5. Check debug console for detailed logs',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            
            const Spacer(),
            
            // Test Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // PressableScale
                PressableScale(
                  onPressed: () {
                    setState(() {
                      _scalePressed++;
                      _lastAction = 'Scale pressed';
                    });
                  },
                  child: Container(
                    width: 100,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade200,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.blue.shade400, width: 2),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.touch_app, size: 24),
                        SizedBox(height: 4),
                        Text('Scale', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                
                // PressableOpacity
                PressableOpacity(
                  onPressed: () {
                    setState(() {
                      _opacityPressed++;
                      _lastAction = 'Opacity pressed';
                    });
                  },
                  child: Container(
                    width: 100,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.green.shade200,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.green.shade400, width: 2),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.opacity, size: 24),
                        SizedBox(height: 4),
                        Text('Opacity', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                
                // PressableBuilder
                PressableBuilder(
                  onPressed: () {
                    setState(() {
                      _builderPressed++;
                      _lastAction = 'Builder pressed';
                    });
                  },
                  builder: (context, isPressed) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      width: 100,
                      height: 80,
                      decoration: BoxDecoration(
                        color: isPressed ? Colors.purple.shade400 : Colors.purple.shade200,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.purple.shade400, width: 2),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.build, size: 24),
                          SizedBox(height: 4),
                          Text('Builder', style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
            
            const SizedBox(height: 20),
            
            // Emergency Reset Button
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  PressableCoordinator.instance.forceEndAllPresses();
                  setState(() {
                    _lastAction = 'Force reset all presses';
                  });
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Emergency Reset'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade200,
                  foregroundColor: Colors.red.shade800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

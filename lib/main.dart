import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'About me',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _likes = 0;

  void _like() {
    setState(() {
      _likes++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab L1 · 67113514'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.account_circle, size: 120, color: Colors.indigo),
            const SizedBox(height: 16),
            const Text(
              'นายพัฒน์ธนิน ปลอดขาว',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('รหัสนักศึกษา 67113514'),
            const SizedBox(height: 24),
            Text('Likes: $_likes', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: _like,
              icon: const Icon(Icons.thumb_up),
              label: const Text('Like'),
            ),
          ],
        ),
      ),
    );
  }
}

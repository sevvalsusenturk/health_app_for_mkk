
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MaterialApp(
      home: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mustafa nın Sağlık Uygulaması'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Hoş Geldiniz!',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                // Diyet planı eklemek için yeni sayfaya yönlendirme
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AddDietPlanPage(),
                ));
              },
              child: const Text('Beslenme Planı Ekle'),
            ),
            // Diyet planları listesi burada gösterilebilir
          ],
        ),
      ),
    );
  }
}

class AddDietPlanPage extends StatefulWidget {
  const AddDietPlanPage({Key? key}) : super(key: key);

  @override
  _AddDietPlanPageState createState() => _AddDietPlanPageState();
}


// ...

void _addDietPlan(Map<String, Map<String, String>> meals) async {
  try {
    final CollectionReference dietPlans =
        FirebaseFirestore.instance.collection('diet_plans');

    await dietPlans.add({
      'meals': meals,
    });

    // Ekledikten sonra formu temizle
    meals.clear();

    // Kullanıcıyı ana sayfaya geri göndermek için aşağıdaki satırı ekleyebilirsiniz
    // Navigator.pop(context);
  } catch (e) {
    // Hata durumunda işlem yapabilirsiniz
    print('Hata: $e');
  }
}





class _AddDietPlanPageState extends State<AddDietPlanPage> {
  // Haftanın her günü için sabah, öğle ve akşam yemeklerini saklamak için listeleri tanımlayın
  final List<String> daysOfWeek = ['Pazartesi', 'Salı', 'Çarşamba', 'Perşembe', 'Cuma', 'Cumartesi', 'Pazar'];
  final Map<String, Map<String, String>> meals = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diyet Planı Ekle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: daysOfWeek.length,
          itemBuilder: (context, index) {
            final day = daysOfWeek[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  day,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Kahvaltı',
                  ),
                  onChanged: (value) {
                    // Sabah yemeği verisini sakla
                    meals[day] ??= {};
                    meals[day]!['sabah'] = value;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Öğle Yemeği',
                  ),
                  onChanged: (value) {
                    // Öğle yemeği verisini sakla
                    meals[day] ??= {};
                    meals[day]!['ogle'] = value;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Akşam Yemeği',
                  ),
                  onChanged: (value) {
                    // Akşam yemeği verisini sakla
                    meals[day] ??= {};
                    meals[day]!['aksam'] = value;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Ara Öğün',
                  ),
                  onChanged: (value) {
                    // Öğle yemeği verisini sakla
                    meals[day] ??= {};
                    meals[day]!['araögün'] = value;
                  },
                ),
                const SizedBox(height: 16),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tüm diyet planını kaydetmek için meals haritasını kullanabilirsiniz
          // Örnek: Firestore'a veya SharedPreferences'e kaydedebilirsiniz.
          _addDietPlan(meals);
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}

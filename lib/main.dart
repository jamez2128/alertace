import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.red,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/AlertAceBG.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'AlertAce',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Your Emergency Assistance Companion',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 200.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    elevation: 5,
                  ),
                  child: const Text('Get Started'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key); // Add key parameter here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context)
            .colorScheme
            .background, // Change 'backgroundColor' to 'background'
        title: const Text("Log in"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: "Username",
                  prefixIcon: Icon(Icons.person),
                  border: UnderlineInputBorder(),
                ),
                onChanged: (String value) {},
                validator: (value) {
                  return value?.isEmpty ?? true
                      ? "Please enter your Username"
                      : null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                enableSuggestions: false,
                autocorrect: false,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock),
                  border: UnderlineInputBorder(),
                ),
                onChanged: (String value) {},
                validator: (value) {
                  return value?.isEmpty ?? true
                      ? "Please enter your password"
                      : null;
                },
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150),
              child: MaterialButton(
                onPressed: () {
                  // Navigate to the EmergencyInfoScreen after login
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EmergencyInfoScreen()),
                  );
                },
                minWidth: double.infinity,
                color: Theme.of(context)
                    .colorScheme
                    .background, // Change 'backgroundColor' to 'background'
                textColor: Colors.white,
                child: const Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmergencyInfoScreen extends StatelessWidget {
  const EmergencyInfoScreen({Key? key})
      : super(key: key); // Add key parameter here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context)
            .colorScheme
            .background, // Change 'backgroundColor' to 'background'
        title: const Text("Emergency Information"),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: "Full Name",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                onChanged: (String value) {},
                validator: (value) {
                  return value?.isEmpty ?? true
                      ? "Please enter your Full Name"
                      : null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: "Address",
                  prefixIcon: Icon(Icons.location_on),
                  border: OutlineInputBorder(),
                ),
                onChanged: (String value) {},
                validator: (value) {
                  return value?.isEmpty ?? true
                      ? "Please enter your Address"
                      : null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: "Contact Number",
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
                onChanged: (String value) {},
                validator: (value) {
                  return value?.isEmpty ?? true
                      ? "Please enter your Contact Number"
                      : null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Add functionality to confirm information and navigate to the next page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainPage()),
                  );
                },
                child: const Text("Confirm"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _tapCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context)
            .colorScheme
            .background, // Change 'backgroundColor' to 'background'
        title: const Text("Choose Your Emergency"),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _tapCount++;
            if (_tapCount == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const EmergencyChoicesPage()),
              );
            }
          });
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text("Tap the screen 3 times to proceed"),
            ],
          ),
        ),
      ),
    );
  }
}

class EmergencyChoicesPage extends StatelessWidget {
  const EmergencyChoicesPage({Key? key})
      : super(key: key); // Add key parameter here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context)
            .colorScheme
            .background, // Change 'backgroundColor' to 'background'
        title: const Text("Emergency Choices"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Handle button tap for car accident
              },
              child: const Text("Car Accident"),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle button tap for chest pain
              },
              child: const Text("Chest Pain"),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle button tap for breathlessness
              },
              child: const Text("Breathlessness"),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle button tap for unconsciousness
              },
              child: const Text("Unconsciousness"),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle button tap for sudden paralysis
              },
              child: const Text("Sudden Paralysis"),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle button tap for physical injury
              },
              child: const Text("Physical Injury"),
            ),
          ],
        ),
      ),
    );
  }
}

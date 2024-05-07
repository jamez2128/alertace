import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
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
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
                    border: UnderlineInputBorder()),
                onChanged: (String value) {},
                validator: (value) {
                  return value!.isEmpty ? "Please enter your Username" : null;
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
                    border: UnderlineInputBorder()),
                onChanged: (String value) {},
                validator: (value) {
                  return value!.isEmpty ? "Please enter your password" : null;
                },
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150),
              child: MaterialButton(
                onPressed: () {
                  // Uncomment and replace placeholder code with the correct navigation
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EmergencyInfoScreen()),
                  );
                },
                minWidth: double.infinity,
                color: Theme.of(context).colorScheme.inversePrimary,
                child: const Text("Login"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpScreen()),
                  );
                },
                minWidth: double.infinity,
                color: Theme.of(context).colorScheme.inversePrimary,
                child: Text(
                  'Sign Up',
                  style:
                  TextStyle(color: Theme.of(context).colorScheme.onSurface),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Sign Up"),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
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
                      return value!.isEmpty
                          ? "Please enter your Username"
                          : null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email),
                      border: UnderlineInputBorder(),
                    ),
                    onChanged: (String value) {},
                    validator: (value) {
                      // Validate email format
                      if (!value!.contains('@') || !value.contains('.')) {
                        return "Please enter a valid email address";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Tooltip(
                    message:
                    "Password must contain at least one uppercase letter, one lowercase letter, one number, and one special character",
                    child: TextFormField(
                      enableSuggestions: false,
                      autocorrect: false,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        hintText: "Enter your password", // Hint text added
                        prefixIcon: Icon(Icons.lock),
                        border: UnderlineInputBorder(),
                      ),
                      onChanged: (String value) {},
                      validator: (value) {
                        // Password validation
                        if (value!.isEmpty) {
                          return "Please enter your password";
                        } else if (value.length < 8) {
                          return "Password must be at least 8 characters long";
                        } else if (!RegExp(
                            r'^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+{}|:"<>?/~`]).{8,}$')
                            .hasMatch(value)) {
                          return "Password must contain at least one uppercase letter, one lowercase letter, one number, and one special character";
                        }
                        return null;
                      },
                    ),
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
                      labelText: "Confirm Password",
                      hintText: "Confirm your password", // Hint text added
                      prefixIcon: Icon(Icons.lock),
                      border: UnderlineInputBorder(),
                    ),
                    onChanged: (String value) {},
                    validator: (value) {
                      // Confirm password validation
                      if (value!.isEmpty) {
                        return "Please confirm your password";
                      } else if (value != value) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150),
                  child: MaterialButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Sign up logic
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              const LoginScreen()), // Corrected reference to LoginScreen
                        );
                      }
                    },
                    minWidth: double.infinity,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    textColor: Colors.white,
                    child: const Text("Sign Up"),
                  ),
                ),
              ],
            ),
          ),
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return Theme.of(context).colorScheme.primary;
                      return Theme.of(context).colorScheme.inversePrimary; // Use the component's default.
                    },
                  ),
                ),
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
  const EmergencyChoicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text("Emergency Choices"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HelpIsOnTheWayPage(),
                  ),
                );
              },
              child: const Text("Car Accident"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HelpIsOnTheWayPage(),
                  ),
                );
              },
              child: const Text("Chest Pain"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HelpIsOnTheWayPage(),
                  ),
                );
              },
              child: const Text("Breathlessness"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HelpIsOnTheWayPage(),
                  ),
                );
              },
              child: const Text("Unconsciousness"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HelpIsOnTheWayPage(),
                  ),
                );
              },
              child: const Text("Sudden Paralysis"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HelpIsOnTheWayPage(),
                  ),
                );
              },
              child: const Text("Physical Injury"),
            ),
          ],
        ),
      ),
    );
  }
}

class HelpIsOnTheWayPage extends StatelessWidget {
  const HelpIsOnTheWayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Introduce a 5-second delay before navigating to HelpHasArrivedPage
    Future.delayed(Duration(seconds: 10), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HelpHasArrivedPage(),
        ),
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Help is on the Way"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('assets/Ambulance.png'), // Replace with your image
              width: 300, // Adjust width as needed
              height: 300, // Adjust height as needed
            ),
            SizedBox(height: 20),
            Text(
              "An ambulance and emergency personnel are en route!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class HelpHasArrivedPage extends StatelessWidget {
  const HelpHasArrivedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help has Arrived"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100,
            ),
            SizedBox(height: 20),
            Text(
              "Help has arrived!",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
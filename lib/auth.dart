import 'package:flutter/material.dart';
import 'package:flutter_blog_club/home.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

enum SelectedSection { login, signup }

class _AuthScreenState extends State<AuthScreen> {
  SelectedSection defualtSelectedPage = SelectedSection.login;
  void updatedSelectedScreen(SelectedSection updateSelectedSection) {
    setState(() {
      defualtSelectedPage = updateSelectedSection;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 32),
                child: SvgPicture.asset(
                  'assets/img/icons/LOGO.svg',
                  width: 110,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: themeData.colorScheme.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () => updatedSelectedScreen(
                             SelectedSection.login,
                            ),
                            child: Text(
                              'LOGIN',
                              style: themeData.textTheme.bodyLarge!.apply(
                                color: themeData.colorScheme.onPrimary,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () => updatedSelectedScreen(
                               SelectedSection.signup,
                            ),
                            child: Text(
                              'SIGN UP',
                              style: themeData.textTheme.bodyLarge!.apply(
                                color: themeData.colorScheme.onPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: themeData.colorScheme.onPrimary,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40, 32, 40, 32),
                        child: defualtSelectedPage == SelectedSection.login
                            ? _Login(themeData: themeData)
                            : _SignUp(themeData: themeData),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Login extends StatelessWidget {
  const _Login({required this.themeData});

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Welcome back', style: themeData.textTheme.bodyLarge),

        Text(
          'Sign in With Your Account',
          style: themeData.textTheme.displaySmall,
        ),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            label: Text('Username', style: themeData.textTheme.bodyMedium),
          ),
        ),
        _Password(themeData: themeData),
        SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomeScreen()));},
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.blue),
            minimumSize: WidgetStatePropertyAll(Size(double.infinity, 60)),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(16),
              ),
            ),
          ),
          child: Text(
            'LOGIN',
            style: themeData.textTheme.bodyLarge!.apply(
              fontSizeFactor: 0.8,
              color: themeData.colorScheme.onPrimary,
            ),
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Forgot Your Password?',
              style: themeData.textTheme.displaySmall,
            ),
            SizedBox(width: 4),
            TextButton(onPressed: () {}, child: Text('Reset here')),
          ],
        ),
        SizedBox(height: 32),
        Center(
          child: Column(
            children: [
              Text(
                'OR SIGN IN WITH',
                style: themeData.textTheme.bodyMedium!.apply(
                  letterSpacingDelta: 2,
                  fontSizeFactor: 0.8,
                ),
              ),
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/img/icons/Google.png', width: 36),
                  SizedBox(width: 32),
                  Image.asset('assets/img/icons/Facebook.png', width: 36),
                  SizedBox(width: 32),
                  Image.asset('assets/img/icons/Twitter.png', width: 36),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SignUp extends StatelessWidget {
  const _SignUp({required this.themeData});

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Welcome To BlogClub', style: themeData.textTheme.bodyLarge),

        Text(
          'Sign Up With Your Account',
          style: themeData.textTheme.displaySmall,
        ),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            label: Text('Full Name', style: themeData.textTheme.bodyMedium),
          ),
        ),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            label: Text('Username', style: themeData.textTheme.bodyMedium),
          ),
        ),
        _Password(themeData: themeData),
        SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomeScreen()));},
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.blue),
            minimumSize: WidgetStatePropertyAll(Size(double.infinity, 60)),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(16),
              ),
            ),
          ),
          child: Text(
            'SignUp',
            style: themeData.textTheme.bodyLarge!.apply(
              fontSizeFactor: 0.8,
              color: themeData.colorScheme.onPrimary,
            ),
          ),
        ),
        SizedBox(height: 32),
        Center(
          child: Column(
            children: [
              Text(
                'OR SIGN UP WITH',
                style: themeData.textTheme.bodyMedium!.apply(
                  letterSpacingDelta: 2,
                  fontSizeFactor: 0.8,
                ),
              ),
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/img/icons/Google.png', width: 36),
                  SizedBox(width: 32),
                  Image.asset('assets/img/icons/Facebook.png', width: 36),
                  SizedBox(width: 32),
                  Image.asset('assets/img/icons/Twitter.png', width: 36),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Password extends StatefulWidget {
  const _Password({required this.themeData});

  final ThemeData themeData;

  @override
  State<_Password> createState() => _PasswordState();
}

class _PasswordState extends State<_Password> {
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: false,
      enableSuggestions: false,
      obscureText: obscure,
      decoration: InputDecoration(
        suffixIcon: TextButton(
          onPressed: () {
            setState(() {
              obscure = !obscure;
            });
          },
          child: Text(obscure ? 'Show' : 'Hide'),
        ),
        label: Text('Password', style: widget.themeData.textTheme.bodyMedium),
      ),
    );
  }
}

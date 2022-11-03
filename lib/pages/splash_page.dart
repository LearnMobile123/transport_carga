import 'package:flutter/material.dart';
import 'package:transport_carga/pages/login_page.dart';


class SplasPage extends StatefulWidget {
  const SplasPage({Key? key}) : super(key: key);

  @override
  State<SplasPage> createState() => _SplasPageState();
}

class _SplasPageState extends State<SplasPage> {

  void initState(){
    _closeSplash();
    super.initState();
  }

  Future<void> _closeSplash() async {
    Future.delayed(const Duration(seconds: 2), () async{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
          image: AssetImage('assets/images/logo.png'),
        ),
      ),
    );
  }
}

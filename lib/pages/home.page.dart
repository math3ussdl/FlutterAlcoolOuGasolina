import 'package:alcohol_or_gasoline/widgets/logo.widget.dart';
import 'package:alcohol_or_gasoline/widgets/submit-form.widget.dart';
import 'package:alcohol_or_gasoline/widgets/success.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _gasCtrl = TextEditingController(text: 'R\$ 0');

  final TextEditingController _alcoholCtrl =
      TextEditingController(text: 'R\$ 0');

  Color _color = Colors.deepPurple;
  bool _busy = false;
  bool _completed = false;
  String _result = 'Compensa usar álcool!';

  reset() {
    setState(() {
      _completed = false;
      _busy = false;
      _color = Colors.deepPurple;
      _gasCtrl.text = 'R\$ 0';
      _alcoholCtrl.text = 'R\$ 0';
    });
  }

  Future calculate() async {
    double alc =
        double.parse(_alcoholCtrl.text.replaceAll(RegExp(r'[R$,.]'), '')) / 100;

    double gas =
        double.parse(_gasCtrl.text.replaceAll(RegExp(r'[R$,.]'), '')) / 100;

    double res = alc / gas;

    setState(() {
      _completed = false;
      _busy = true;
      _color = Colors.deepPurpleAccent;
    });

    return Future.delayed(
        const Duration(seconds: 3),
        () => {
              setState(() {
                if (res >= 0.7) {
                  _result = 'Compensa utilizar Gasolina!';
                } else {
                  _result = 'Compensa utilizar Álcool!';
                }

                _busy = false;
                _completed = true;
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: AnimatedContainer(
          duration: const Duration(
            milliseconds: 1200,
          ),
          color: _color,
          child: ListView(
            children: [
              const Logo(),
              _completed
                  ? Success(reset: reset, result: _result)
                  : SubmitForm(
                      busy: _busy,
                      alcoholCtrl: _alcoholCtrl,
                      gasCtrl: _gasCtrl,
                      submitFunc: calculate,
                    ),
            ],
            padding: const EdgeInsets.symmetric(vertical: 80),
          ),
        ),
      ),
    );
  }
}

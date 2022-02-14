import 'package:alcohol_or_gasoline/widgets/input.widget.dart';
import 'package:alcohol_or_gasoline/widgets/loading-button.widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SubmitForm extends StatelessWidget {
  TextEditingController? gasCtrl = TextEditingController();
  TextEditingController? alcoholCtrl = TextEditingController();
  bool? busy = false;
  Function? submitFunc;

  SubmitForm({
    Key? key,
    this.alcoholCtrl,
    this.gasCtrl,
    this.busy,
    this.submitFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      child: Column(
        children: [
          Input(
            label: 'Gasolina',
            ctrl: gasCtrl,
          ),
          Input(
            label: 'Álcool',
            ctrl: alcoholCtrl,
          ),
          const SizedBox(
            height: 25,
          ),
          LoadingButton(
            busy: busy,
            invert: false,
            func: submitFunc,
            text: 'CALCULAR',
          ),
        ],
      ),
    );
  }
}

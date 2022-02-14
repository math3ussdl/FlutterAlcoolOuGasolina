import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoadingButton extends StatelessWidget {
  bool? busy = false;
  bool? invert = false;
  Function? func;
  String? text = "";

  LoadingButton({
    Key? key,
    @required this.busy,
    @required this.invert,
    @required this.func,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: invert!
            ? Theme.of(context).primaryColor
            : Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(
          60,
        ),
      ),
      child: TextButton(
        onPressed: () {
          func!();
        },
        child: busy!
            ? CircularProgressIndicator(
                backgroundColor: Theme.of(context).primaryColor,
                color: Colors.white.withOpacity(0.8),
              )
            : Text(
                text!,
                style: TextStyle(
                  color:
                      invert! ? Colors.white : Theme.of(context).primaryColor,
                  fontFamily: 'Big Shoulders Display',
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
      ),
    );
  }
}

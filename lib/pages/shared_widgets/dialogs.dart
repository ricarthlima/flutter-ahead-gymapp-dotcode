import 'package:flutter/material.dart';

class AbstractDialog extends StatelessWidget {
  final IconData? iconData;
  final String? title;
  final String? message;
  final Function? whenCancel;
  final Function? whenConfirm;
  final bool? showCancel;

  const AbstractDialog(
      {this.iconData,
      this.title,
      this.message,
      this.whenCancel,
      this.whenConfirm,
      this.showCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title!),
      content: Container(
        height: 88,
        child: Column(
          children: [
            Icon(
              iconData,
              size: 64,
            ),
            Text(
              message!,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      actions: [
        Visibility(
          visible: showCancel!,
          child: TextButton(
              onPressed: () {
                whenCancel!();
              },
              child: Text("Cancel")),
        ),
        TextButton(
            onPressed: () {
              whenConfirm!();
            },
            child: Text("OK"))
      ],
    );
  }
}

class SuccessDialog extends StatelessWidget {
  final String? message;
  final Function? whenCancel;
  final Function? whenConfirm;

  const SuccessDialog({
    this.message,
    this.whenCancel,
    this.whenConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AbstractDialog(
      title: "Sucesso",
      message: message,
      whenCancel:
          whenCancel != null ? whenCancel : () => Navigator.pop(context),
      whenConfirm:
          whenConfirm != null ? whenConfirm : () => Navigator.pop(context),
      iconData: Icons.check,
      showCancel: false,
    );
  }
}

class ErrorDialog extends StatelessWidget {
  final String? message;
  final Function? whenCancel;
  final Function? whenConfirm;

  const ErrorDialog({
    this.message,
    this.whenCancel,
    this.whenConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AbstractDialog(
      title: "Ocorreu um erro",
      message: message,
      whenCancel:
          whenCancel != null ? whenCancel : () => Navigator.pop(context),
      whenConfirm:
          whenConfirm != null ? whenConfirm : () => Navigator.pop(context),
      iconData: Icons.warning,
      showCancel: false,
    );
  }
}

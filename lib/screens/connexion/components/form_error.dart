import 'package:flutter/material.dart';

import '../../../constante.dart';

class FormError extends StatelessWidget {
  const FormError({
    super.key,
    required this.error,
  });

  final List<String> error;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          List.generate(error.length, (index) => formErrorText(error[index])),
    );
  }

  Row formErrorText(String error) {
    return Row(
      children: [
        Icon(Icons.error_outline, color: kPrimaryColor),
        Text(
          error,
          style: TextStyle(
            color: kPrimaryColor,
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

class CustomDropdownMenuItem<T> extends DropdownMenuItem<T> {
  CustomDropdownMenuItem({
    super.key,
    required final T value,
    required final Widget child,
    required final VoidCallback onTap,
  }) : super(
          value: value,
          child: GestureDetector(
            onTap: onTap,
            child: child,
          ),
        );
}

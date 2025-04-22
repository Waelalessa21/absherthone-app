import 'package:flutter/material.dart';

class OtpInputField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onCompleted;

  const OtpInputField({
    super.key,
    required this.controller,
    required this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(6, (index) {
          return _OtpBox(
            index: index,
            controller: controller,
            onCompleted: onCompleted,
          );
        }),
      ),
    );
  }
}

class _OtpBox extends StatefulWidget {
  final int index;
  final TextEditingController controller;
  final VoidCallback onCompleted;

  const _OtpBox({
    required this.index,
    required this.controller,
    required this.onCompleted,
  });

  @override
  State<_OtpBox> createState() => _OtpBoxState();
}

class _OtpBoxState extends State<_OtpBox> {
  late FocusNode _focusNode;
  String _char = '';

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    widget.controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    final text = widget.controller.text;
    if (text.length == 6) {
      widget.onCompleted();
    }
    if (text.length > widget.index) {
      setState(() {
        _char = text[widget.index];
      });
    } else {
      setState(() {
        _char = '';
      });
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  void _handleInput(String value) {
    final text = widget.controller.text;
    final newText = text.length > widget.index
        ? text.substring(0, widget.index) +
            value +
            text.substring(widget.index + 1)
        : text + value;

    widget.controller.text = newText.substring(0, newText.length.clamp(0, 6));
    final nextIndex = widget.index + 1;
    if (nextIndex < 6) {
      FocusScope.of(context).nextFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 55,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: TextField(
          focusNode: _focusNode,
          textAlign: TextAlign.center,
          maxLength: 1,
          keyboardType: TextInputType.number,
          style: Theme.of(context).textTheme.titleMedium,
          decoration: const InputDecoration(
            counterText: '',
            border: InputBorder.none,
          ),
          onChanged: (value) {
            if (value.isNotEmpty) _handleInput(value);
          },
          controller: TextEditingController(text: _char),
        ),
      ),
    );
  }
}

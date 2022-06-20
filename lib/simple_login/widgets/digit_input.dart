import 'package:flutter/material.dart';
import 'package:flutter_playground/app/resources/r.dart';
// import 'package:flutter/services.dart';

const zeroWidthSpace = '\u200B';

class DigitInput extends StatefulWidget {
  const DigitInput({Key? key}) : super(key: key);

  @override
  State<DigitInput> createState() => _DigitInputState();
}

class _DigitInputState extends State<DigitInput> {
  late List<FocusNode> _focusNodes;
  final List<TextEditingController> _textControllers =
      List<TextEditingController>.generate(
          4, (index) => TextEditingController());
  int _currentFocusIndex = 0;

  @override
  void initState() {
    super.initState();
    _focusNodes = List<FocusNode>.generate(4, (_) => FocusNode());
    _textControllers[0].text = zeroWidthSpace;
    for (var i = 0; i < 4; i++) {
      _textControllers[i].addListener(() {
        if (_textControllers[i].text.isEmpty) {
          if (i != 0) {
            _focusNodes[i - 1].requestFocus();
            _currentFocusIndex = i - 1;
          } else {
            _textControllers[i].text = zeroWidthSpace;
            _focusNodes[i].unfocus();
          }
        } else if (_textControllers[i].text.length > 1) {
          if (i != 3) {
            _textControllers[i + 1].text = zeroWidthSpace;
            _focusNodes[i + 1].requestFocus();
            _currentFocusIndex = i + 1;
          } else {
            _focusNodes[i].unfocus();
          }
        }
      });
    }
  }

  void onTap() {
    _focusNodes[_currentFocusIndex].requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < 4; i++) ...[
          DigitInputField(
            key: ValueKey('digit-$i'),
            focusNode: _focusNodes[i],
            onTap: onTap,
            textController: _textControllers[i],
          ),
          if (i != 3) const Spacer(),
        ],
      ],
    );
  }

  @override
  void dispose() {
    for (var i = 0; i < 4; i++) {
      _focusNodes[i].dispose();
      _textControllers[i].dispose();
    }

    super.dispose();
  }
}

class DigitInputField extends StatefulWidget {
  const DigitInputField({
    Key? key,
    required this.focusNode,
    required this.textController,
    required this.onTap,
  }) : super(key: key);
  final FocusNode focusNode;
  final TextEditingController textController;
  final VoidCallback onTap;

  @override
  State<DigitInputField> createState() => _DigitInputFieldState();
}

class _DigitInputFieldState extends State<DigitInputField> {
  @override
  void initState() {
    super.initState();
    widget.textController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: TextField(
        maxLength: 2,
        controller: widget.textController,
        onTap: widget.onTap,
        textAlign: TextAlign.center,
        showCursor: false,
        // strutStyle: StrutStyle.disabled,
        decoration: InputDecoration(
          fillColor: widget.textController.text.length == 2
              ? R.colors.white.withOpacity(0)
              : null,
          counterText: '',
          enabledBorder: widget.textController.text.length == 2
              ? Theme.of(context).inputDecorationTheme.focusedBorder?.copyWith(
                    borderSide: BorderSide(
                      color: R.colors.primary,
                      width: 1,
                    ),
                  )
              : null,
          focusedBorder:
              Theme.of(context).inputDecorationTheme.focusedBorder?.copyWith(
                    borderSide: BorderSide(
                      color: R.colors.primary,
                      width: 1,
                    ),
                  ),
        ),
        autofocus: true,
        focusNode: widget.focusNode,
      ),
    );
  }
}

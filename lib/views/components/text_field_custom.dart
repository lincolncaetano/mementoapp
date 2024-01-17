import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mementoapp/main.dart';

class TextFieldWidget extends StatefulWidget {
  TextFieldWidget({
    Key? key,
    this.texto,
    this.controller,
    this.validator,
    this.autofillHints,
    this.obscure,
    this.keyboardType
  }) : super(key: key);

  final String? texto;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Iterable<String>?  autofillHints;
  final bool? obscure;
  final TextInputType? keyboardType;

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);

  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
      child: Container(
        width: double.infinity,
        child: TextFormField(
          controller: widget.controller,
          autofocus: true,
          autofillHints: widget.autofillHints,
          obscureText: widget.obscure == null ?  false : widget.obscure!,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            labelText: widget.texto,
            labelStyle: Theme.of(context).textTheme
                .labelLarge!.merge(
                const TextStyle(
                    color: MyAppColorScheme.primaryColor,
                    fontSize: 18
                )
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: const MyAppColorScheme().background,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context)
                    .primaryColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: MyAppColorScheme()
                    .error,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: MyAppColorScheme()
                    .error,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
            fillColor: const MyAppColorScheme()
                .background,
          ),
          style:
          Theme.of(context).textTheme.bodyLarge!.merge( const TextStyle( color: Colors.white)),
          validator: widget.validator,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mementoapp/main.dart';

class ElevateButtonWidget extends StatefulWidget {
  ElevateButtonWidget({
    Key? key,
    required this.texto,
    required this.onPress
  }) : super(key: key);

  final String texto;
  final Function() onPress;


  @override
  _ElevateButtonWidgetState createState() => _ElevateButtonWidgetState();
}

class _ElevateButtonWidgetState extends State<ElevateButtonWidget> {

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
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          child: Text( widget.texto , style: TextStyle(color: Colors.white, fontSize: 18),),
          onPressed: widget.onPress,
          style: ElevatedButton.styleFrom( //background color of button
            //side: BorderSide(width:3, color:Colors.brown), //border width and color
              backgroundColor: MyAppColorScheme().primary,
              surfaceTintColor: MyAppColorScheme.alternate,
              elevation: 3, //elevation of button
              shape: RoundedRectangleBorder( //to set border radius to button
                  borderRadius: BorderRadius.circular(12)
              ),
              padding: EdgeInsets.all(20) //content padding inside button
          ).copyWith(
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed))
                    return MyAppColorScheme().primary.withOpacity(0.5);
                return MyAppColorScheme().primary; // Use the component's default.
              },
            ),
          )
      ),
    );
  }
}

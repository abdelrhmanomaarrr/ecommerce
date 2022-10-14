import 'package:flutter/material.dart';

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(builder: (_) => widget),
);

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (_) => widget),
      (route) => false,
);

// void signOut(context) {
//   CacheHelper.removeData(key: SharedKeys.token);
//   navigateAndFinish(context, LoginScreen());
// }

Widget defaultButton({
  double width = double.infinity,
  required String text,
  bool isUpper = true,
  Color back = Colors.green,
  required Function onPressed,
}) =>
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: back,
        ),
        child: TextButton(
          onPressed: () => onPressed(),
          child: Text(
            isUpper ? text.toUpperCase() : text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );

Widget descriptionFormField({
  TextEditingController? controller,
  String? label,
  bool? isPassword = false,
  IconData? suffix,
  Function? suffixPressed,
  Function? onSubmit,
})=> Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Text(label!),
    ),
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: double.infinity,
        height: 200,
        child: TextFormField(
          //onFieldSubmitted: onSubmit!(),
          obscureText: isPassword!,
          controller: controller,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter Valid data';
            }
          },
          decoration: InputDecoration(
            suffixIcon: suffix != null
                ? IconButton(
                onPressed: () => suffixPressed!(), icon: Icon(suffix))
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    ),
  ],
);

Widget defaultFormField({
  TextEditingController? controller,
  dynamic label,
  IconData ? prefix,
  String ? initialValue,
  TextInputType ?keyboardType,
  Function? onSubmit,
  onChange,
  onTap,
  required String? Function(String?) validate,
  bool isPassword = false,
  bool enabled = true,
  IconData ?suffix,
  suffixPressed,
}) =>
    Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isPassword,
        textAlign: TextAlign.start,
        onFieldSubmitted: (value) {
          onSubmit!(value);
        },
        enabled: enabled,
        onChanged: onChange,
        onTap: onTap,
        validator: validate,
        textCapitalization: TextCapitalization.words,
        textAlignVertical: TextAlignVertical.center,
        initialValue:initialValue ,
        //textCapitalization: TextCapitalization.words,

        decoration:
        InputDecoration(
          hintText: label,
          prefixIcon: Icon(prefix,),
          suffixIcon: suffix != null ? IconButton(onPressed: suffixPressed, icon: Icon(suffix)) : null,
          border: OutlineInputBorder(
          ),
        ),
      ),
    );
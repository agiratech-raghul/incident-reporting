// import 'package:atic_excelsior_fht/src/utils/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class CommonTextField extends StatefulWidget {
//   final TextEditingController? controller;
//   final double? width, height, fieldWidth, fieldHeight;
//   final int? maxLength;
//   final String? hintText, floatingText;
//   final TextStyle hintStyle, errorStyle, inputStyle;
//   final EdgeInsets? contentPadding;
//   final void Function(String? value)? onSaved, onChanged;
//   final Widget? prefix;
//   final bool showCursor;
//   final bool autofocus;
//   final Color? shadowColor;
//   final bool showErrorBorder;
//   final double? elevation;
//   final TextAlign textAlign;
//   final Alignment errorAlign, floatingAlign;
//   final Color fillColor;
//   final Widget? suffixIcon;
//   final Color? backgroudcolor;
//   final TextInputType keyboardType;
//   final TextInputAction textInputAction;
//   final String? Function(String? value) validator;
//   final InputDecoration? decoration;
//   final int? maxLines;
//   final bool? filled;
//   final bool? autoValidate;
//   final String? errorText;
//   final String? initialValue;
//   final double? radius;
//   final TextStyle? floatingStyle;

//   final BorderSide? borderSide;
//   final String? hintsType;
//   final bool enabled;
//   const CommonTextField({
//     Key? key,
//     this.controller,
//     this.decoration,
//     this.hintsType,
//     this.enabled = true,
//     this.borderSide,
//     this.filled,
//     this.errorText,
//     this.radius,
//     this.elevation,
//     this.autoValidate = false,
//     this.shadowColor,
//     this.maxLines,
//     this.initialValue,
//     this.floatingStyle,
//     this.suffixIcon,
//     this.width,
//     this.height = UIDimens.size60,
//     this.floatingAlign = Alignment.centerLeft,
//     this.fieldHeight,
//     this.fieldWidth,
//     this.maxLength,
//     this.onSaved,
//     this.floatingText,
//     this.onChanged,
//     this.backgroudcolor,
//     this.prefix,
//     this.showCursor = true,
//     this.showErrorBorder = false,
//     this.autofocus = false,
//     this.textAlign = TextAlign.start,
//     this.errorAlign = Alignment.topLeft,
//     this.fillColor = AppColors.white,
//     this.hintText,
//     this.hintStyle = const TextStyle(
//         fontSize: UIDimens.size14,
//         color: AppColors.hintTextColor,
//         fontWeight: FontWeight.w400),
//     this.errorStyle = const TextStyle(
//       height: 0,
//       color: Colors.transparent,
//     ),
//     this.inputStyle = const TextStyle(
//       fontSize: UIDimens.size17,
//       color: AppColors.black,
//     ),
//     this.contentPadding = const EdgeInsets.fromLTRB(
//         UIDimens.size17, UIDimens.size10, UIDimens.size1, UIDimens.size10),
//     required this.keyboardType,
//     required this.textInputAction,
//     required this.validator,
//   }) : super(key: key);

//   @override
//   State<CommonTextField> createState() => _CommonTextFieldState();
// }

// class _CommonTextFieldState extends State<CommonTextField> {
//   String? errorText;
//   bool hidePassword = true;
//   bool get hasError => errorText != null;
//   bool get showErrorBorder => widget.showErrorBorder && hasError;
//   bool get isPasswordField =>
//       widget.keyboardType == TextInputType.visiblePassword;
//   void _onSaved(String? value) {
//     value = value!.trim();
//     widget.controller?.text = value;
//     widget.onSaved?.call(value);
//   }

//   void _onChanged(String value) {
//     if (widget.onChanged != null) {
//       _runValidator(value);
//       widget.onChanged!(value);
//     }
//   }

//   void onChanged(String value) {
//     print(value);
//     if (widget.onChanged != null) {
//       _runValidator(value);
//       widget.onChanged!(value);
//     }
//   }

//   String? _runValidator(String? value) {
//     final error = widget.validator(value!.trim());
//     setState(() {
//       errorText = error;
//     });
//     return error;
//   }

//   void _togglePasswordVisibility() {
//     setState(() {
//       hidePassword = !hidePassword;
//     });
//   }

//   OutlineInputBorder _normalBorder(
//       {double? radius = 9, BorderSide? borderSide}) {
//     return OutlineInputBorder(
//       borderRadius: BorderRadius.all(Radius.circular(radius ?? 0)),
//       borderSide: borderSide ?? BorderSide.none,
//     );
//   }

//   bool get hasFloatingText => widget.floatingText != null;

//   @override
//   Widget build(BuildContext context) {
//     print("widget.errorText${widget.errorText}");
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         SizedBox(
//           width: widget.fieldWidth,
//           height: Utils.getScreenHeight(context, 60),
//           child: PhysicalModel(
//             color: widget.backgroudcolor ?? Colors.transparent,
//             borderRadius: BorderRadius.circular(widget.radius ?? 0),
//             elevation: widget.elevation ?? 0,
//             child: TextFormField(
//               key: widget.key,
//               autofillHints: [widget.hintsType ?? AutofillHints.name],
//               initialValue: widget.initialValue,
//               controller: widget.controller,
//               textAlign: widget.textAlign,
//               autofocus: widget.autofocus,
//               maxLines: widget.maxLines,
//               maxLength: widget.maxLength,
//               keyboardType: widget.keyboardType,
//               textInputAction: widget.textInputAction,
//               style: widget.inputStyle,
//               showCursor: widget.showCursor,
//               maxLengthEnforcement: MaxLengthEnforcement.enforced,
//               textAlignVertical: TextAlignVertical.center,
//               autovalidateMode: AutovalidateMode.disabled,
//               cursorColor: AppColors.primaryColor,
//               obscureText: isPasswordField && hidePassword,
//               validator: _runValidator,
//               onFieldSubmitted: _runValidator,
//               onSaved: _onSaved,
//               onChanged: _onChanged,
//               enabled: widget.enabled,
//               decoration: widget.decoration ??
//                   InputDecoration(
//                     errorStyle: const TextStyle(
//                         height: UIDimens.zero, fontSize: UIDimens.size12),
//                     errorMaxLines: 3,
//                     errorText: widget.errorText,
//                     fillColor: widget.fillColor,
//                     prefixIcon: widget.prefix,
//                     contentPadding: widget.contentPadding,
//                     // isDense: true,
//                     filled: widget.filled,
//                     label: Text("${widget.floatingText}"),

//                     border: _normalBorder(),
//                     focusedBorder: _normalBorder(
//                         radius: widget.radius, borderSide: widget.borderSide),
//                     focusedErrorBorder: _normalBorder(),
//                     enabledBorder: _normalBorder(
//                         radius: widget.radius, borderSide: widget.borderSide),
//                     errorBorder: showErrorBorder ? _normalBorder() : null,
//                     suffixIcon: widget.suffixIcon ??
//                         ((widget.controller?.text == null ||
//                                 widget.controller?.text == '')
//                             ? null
//                             : isPasswordField
//                                 ? InkWell(
//                                     onTap: _togglePasswordVisibility,
//                                     child: Icon(
//                                       hidePassword
//                                           ? Icons.visibility_off
//                                           : Icons.visibility,
//                                       color: AppColors.commonIconColor,
//                                       size: UIDimens.size22,
//                                     ),
//                                   )
//                                 : null),
//                   ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:incident_reporting/src/utils/src/colors/app_colors.dart';
import 'package:incident_reporting/src/utils/src/helpers/ui_dimens.dart';
import 'package:size_setter/size_setter.dart';

class CommonTextFields extends StatefulWidget {
  final TextEditingController? controller;
  final double? width, height, fieldWidth, fieldHeight;
  final int? maxLength;
  final String? hintText, floatingText;
  final TextStyle hintStyle, errorStyle, inputStyle;
  final EdgeInsets? contentPadding;
  final void Function(String? value)? onSaved, onChanged;
  final Widget? prefix;
  final bool showCursor;
  final bool autofocus;
  final Color? shadowColor;
  final bool showErrorBorder;
  final AutovalidateMode autoValidateMode;
  final double? elevation;
  final TextAlign textAlign;
  final Alignment errorAlign, floatingAlign;
  final Color fillColor;
  final Widget? suffixIcon;
  final Color? backgroudcolor;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String? Function(String? value) validator;
  final InputDecoration? decoration;
  final int? maxLines;
  final bool? filled;
  final bool? autoValidate;
  final bool? alignLabelWithHint;
  final String? errorText;
  final String? initialValue;
  final double? radius;
  final TextStyle? floatingStyle;
  final BorderSide? borderSide;
  final String? hintsType;
  final bool enabled;
  const CommonTextFields({
    Key? key,
    this.controller,
    this.decoration,
    this.hintsType,
    this.enabled = true,
    this.borderSide,
    this.filled,
    this.errorText,
    this.radius,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.elevation,
    this.autoValidate = false,
    this.shadowColor,
    this.maxLines,
    this.initialValue,
    this.floatingStyle,
    this.suffixIcon,
    this.width,
    this.height = UIDimens.size60,
    this.floatingAlign = Alignment.centerLeft,
    this.fieldHeight,
    this.fieldWidth,
    this.maxLength,
    this.onSaved,
    this.floatingText,
    this.onChanged,
    this.backgroudcolor,
    this.prefix,
    this.showCursor = true,
    this.showErrorBorder = false,
    this.autofocus = false,
    this.textAlign = TextAlign.start,
    this.errorAlign = Alignment.topLeft,
    this.fillColor = Colors.white,
    this.hintText,
    this.hintStyle = const TextStyle(
        fontSize: UIDimens.size14,
        color: AppColors.hintTextColor,
        fontWeight: FontWeight.w400),
    this.errorStyle = const TextStyle(
      height: 0,
      color: Colors.transparent,
    ),
    this.inputStyle = const TextStyle(
      fontSize: 14,
      color: Colors.black,
    ),
    this.contentPadding = const EdgeInsets.fromLTRB(
        UIDimens.size17, UIDimens.size10, UIDimens.size1, UIDimens.size10),
    required this.keyboardType,
    required this.textInputAction,
    required this.validator,
    this.alignLabelWithHint,
  }) : super(key: key);

  @override
  State<CommonTextFields> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextFields> {
  String? errorText;
  bool hidePassword = true;
  bool get hasError => errorText != null;
  bool get showErrorBorder => widget.showErrorBorder && hasError;
  bool get isPasswordField =>
      widget.keyboardType == TextInputType.visiblePassword;
  void _onSaved(String? value) {
    value = value!.trim();
    widget.controller?.text = value;
    widget.onSaved?.call(value);
  }

  void _onChanged(String value) {
    if (widget.onChanged != null) {
      _runValidator(value);
      widget.onChanged!(value);
    }
  }

  void onChanged(String value) {
    print(value);
    if (widget.onChanged != null) {
      _runValidator(value);
      widget.onChanged!(value);
    }
  }

  String? _runValidator(String? value) {
    final error = widget.validator(value!.trim());
    setState(() {
      errorText = error;
    });
    return error;
  }

  void _togglePasswordVisibility() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  OutlineInputBorder _normalBorder(
      {double? radius = 9, BorderSide? borderSide}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(radius ?? 0)),
      borderSide: borderSide ?? BorderSide.none,
    );
  }

  bool get hasFloatingText => widget.floatingText != null;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxWidth: widget.fieldWidth ?? double.infinity,
            minHeight: Utils.getScreenHeight(context, 56)),
        child: PhysicalModel(
          color: widget.backgroudcolor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(widget.radius ?? 0),
          elevation: widget.elevation ?? 0,
          child: TextFormField(
            key: widget.key,
            autofillHints: [widget.hintsType ?? AutofillHints.name],
            initialValue: widget.initialValue,
            controller: widget.controller,
            textAlign: widget.textAlign,
            autofocus: widget.autofocus,
            maxLines: widget.maxLines,
            maxLength: widget.maxLength,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            style: widget.inputStyle,
            showCursor: widget.showCursor,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            textAlignVertical: TextAlignVertical.center,
            autovalidateMode: widget.autoValidateMode,
            cursorColor: AppColors.primaryColor,
            obscureText: isPasswordField && hidePassword,
            validator: _runValidator,
            onFieldSubmitted: _runValidator,
            onSaved: _onSaved,
            onChanged: _onChanged,
            enabled: widget.enabled,
            decoration: widget.decoration ??
                InputDecoration(
                  alignLabelWithHint: widget.alignLabelWithHint,
                  border: InputBorder.none,
                  label: Text(
                    widget.floatingText ?? '',
                  ),
                  // counterText: "(7/7)",
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorStyle: const TextStyle(
                      height: UIDimens.zero, fontSize: UIDimens.size12),
                  // errorMaxLines: 3,
                  // errorText: widget.errorText,
                  fillColor: widget.fillColor,
                  prefixIcon: widget.prefix,
                  contentPadding: widget.contentPadding,
                  // isDense: true,
                  filled: widget.filled,
                  suffixIcon: widget.suffixIcon ??
                      ((widget.controller?.text == null ||
                              widget.controller?.text == '')
                          ? null
                          : isPasswordField
                              ? InkWell(
                                  onTap: _togglePasswordVisibility,
                                  child: Icon(
                                    hidePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: AppColors.commonIconColor,
                                    size: UIDimens.size22,
                                  ),
                                )
                              : null),
                ),
          ),
        ),
      ),
    );
  }
}

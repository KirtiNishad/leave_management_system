import 'package:flutter/material.dart';

class AppDropdown extends StatefulWidget {
  final List<DropdownMenuItem> items;
  final Function(Object? value)? onChanged;
  final Object? selectedValue;
  final String hint;

  AppDropdown(
      {super.key,
      required this.items,
      required this.onChanged,
      required this.hint,
      this.selectedValue});

  @override
  State<AppDropdown> createState() => _AppDropdownState();
}

class _AppDropdownState extends State<AppDropdown> {
  late final ValueNotifier<Object?> selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = ValueNotifier(widget.selectedValue);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Object?>(
        valueListenable: selectedValue,
        builder: (context, value, item) {
          return DropdownButtonFormField<Object?>(
            items: widget.items,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade50,
              isDense: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1,
                    color: Theme.of(context).primaryColor,
                    style: BorderStyle.solid),
              ),
              border: OutlineInputBorder(
              borderSide: BorderSide(
              width: 1,
              color: Theme.of(context).primaryColor,
          style: BorderStyle.solid),
          ),),
            onChanged: widget.onChanged == null
                ? null
                : (value) {
                    selectedValue.value = value;
                    widget.onChanged!(value);
                  },
            borderRadius: BorderRadius.circular(8),
            isExpanded: true,
            alignment: AlignmentDirectional.topStart,
            autofocus: true,
            hint: Text(
              widget.hint,
              maxLines: 1,
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            ),
          );
        });
  }
}

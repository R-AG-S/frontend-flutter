import 'package:flutter/material.dart';
import 'package:payup/widgets/textform.dart';

class EditPageScreen extends StatefulWidget {
  EditPageScreen({
    @required this.name,
    @required this.url,
    @required this.value,
    @required this.inputType,
  });
  final String name;
  final String value;
  final String url;
  final TextInputType inputType;
  @override
  _EditPageScreenState createState() => _EditPageScreenState();
}

class _EditPageScreenState extends State<EditPageScreen> {
  final TextEditingController _editController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Edit ' + widget.name,
            style: TextStyle(
              fontFamily: 'Bambino',
              letterSpacing: 0.5,
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: TextFormWidget(
                  hint: widget.name,
                  firstNameController: _editController,
                  type: widget.inputType,
                  obscure: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

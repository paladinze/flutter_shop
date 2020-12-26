import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit_profile';

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descFocusNode = FocusNode();
  final _imgController = TextEditingController();
  final _form = GlobalKey<FormState>();
  var isLoading = false;

  void onSubmit() async {
    print('onSubmit');
    setState(() {
      isLoading = true;
    });
    final payload = json.encode(
      {
        'title': 'batman',
      },
    );

    await http.post(
      'http://localhost:3000/posts',
      body: payload,
      headers: {"Content-Type": "application/json"},
    );
    print('onSubmit success');
    setState(() {
      isLoading = false;
    });
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('save success'),
          content: Text('some message'),
          actions: [
            FlatButton(onPressed: () { Navigator.of(context).pop(); }, child: Text('OK!'))
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _priceFocusNode.dispose();
    _descFocusNode.dispose();
    _imgController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: _form,
                child: ListView(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Title',
                      ),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(_priceFocusNode);
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Price',
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      focusNode: _priceFocusNode,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(_descFocusNode);
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Description',
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      focusNode: _descFocusNode,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Image URL',
                      ),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imgController,
                    ),
                  ],
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: onSubmit,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

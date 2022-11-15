// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, use_build_context_synchronously

import 'package:grupp_project/services/firebase/firebase_database.dart';
import 'package:grupp_project/widgets/category_gradient.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AddRecipe extends StatefulWidget {
  @override
  State<AddRecipe> createState() => _AddRecipeState();
}

// display this image: https://images.unsplash.com/photo-1607285179635-dd06da10eac1?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMzZ8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60

class _AddRecipeState extends State<AddRecipe> {
  final _formKey = GlobalKey<FormState>();
  final _recipeNameController = TextEditingController();
  final _recipeDescriptionController = TextEditingController();
  final _recipeIngredientsController = TextEditingController();
  final _recipeInstructionsController = TextEditingController();
  final _recipeCategoryController = TextEditingController();
  File? _image;

  final items = [
    'Meat',
    'Soup',
    'Pasta',
    'Taco',
    'Pizza',
    'Dessert',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CategoryGradient(),
        SingleChildScrollView(
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.all(25.0),
              margin: EdgeInsets.only(bottom: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      'Add a new recipe',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        _recipeImage(),
                        Container(
                          margin: EdgeInsets.only(top: 25.0, bottom: 20.0),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0xDDDDDDDD),
                                blurRadius: 4.0,
                                spreadRadius: 2.0,
                                offset: Offset(0.0, 1.0),
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              _dropdownMenu(),
                              SizedBox(
                                height: 10.0,
                              ),
                              TextFormField(
                                controller: _recipeNameController,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  labelText: 'Recipe name',
                                  labelStyle: TextStyle(
                                    color: Colors.black54,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                ),
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a recipe name';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              TextFormField(
                                controller: _recipeDescriptionController,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  labelText: 'Recipe description',
                                  labelStyle: TextStyle(
                                    color: Colors.black54,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                ),
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a recipe description';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              TextFormField(
                                controller: _recipeIngredientsController,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  labelText: 'Recipe ingredients',
                                  labelStyle: TextStyle(
                                    color: Colors.black54,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                ),
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the recipe ingredients';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              TextFormField(
                                controller: _recipeInstructionsController,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  labelText: 'Recipe instructions',
                                  labelStyle: TextStyle(
                                    color: Colors.black54,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                ),
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the recipe instructions';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _handleSubmit,
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.black87,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: 5.0, left: 5.0, right: 5.0),
        duration: Duration(seconds: 2),
        content: Text(
          'Processing Data..',
          textAlign: TextAlign.center,
        ),
      ),
    );

    try {
      await Future.delayed(Duration(milliseconds: 2500));
      await FirebaseDatabase().itemsPost(
        _recipeNameController.text,
        _recipeDescriptionController.text,
        _image.toString(),
        _recipeCategoryController.text,
        _recipeIngredientsController.text,
        _recipeInstructionsController.text,
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(bottom: 5.0, left: 5.0, right: 5.0),
          duration: Duration(seconds: 1),
          content: Text(
            'Error adding recipe',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    _clearTextControllers();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green.shade600,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: 5.0, left: 5.0, right: 5.0),
        duration: Duration(seconds: 1),
        content: Text(
          'Added new recipe!',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _dropdownMenu() {
    // use items as a dropdown menu and make it required
    // make the button wide enough to fit the screen
    // items in dropdown should appear horizontally

    return Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
        iconEnabledColor: Theme.of(context).colorScheme.secondary,
        hint: Text(
          'Food type',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        items: items.map((String value) {
          return DropdownMenuItem(
            // validate that a category is selected
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? value) {
          setState(() {
            _recipeCategoryController.text = value!;
          });
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please pick a food type';
          }
          return null;
        },
      ),
    );
  }

  Future _getImage() async {
    // getImage
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = File(image!.path);
    });

    return _image;
  }

  Widget _recipeImage() {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        border: Border.all(
          color: Color.fromARGB(255, 255, 255, 255),
          width: 1.0,
          strokeAlign: StrokeAlign.outside,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(221, 168, 168, 168),
            blurRadius: 4.0,
            spreadRadius: 2.0,
            offset: Offset(0.0, 1.0),
          )
        ],
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          _image == null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    'https://media.self.com/photos/622912847b959736301bfb91/2:1/w_1280,c_limit/GettyImages-1301412050.jpg',
                    fit: BoxFit.cover,
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.file(
                    _image!,
                    fit: BoxFit.cover,
                  ),
                ),
          Positioned(
            bottom: 10,
            right: 10,
            child: FloatingActionButton(
              elevation: 10,
              backgroundColor: Colors.white,
              onPressed: () => _getImage(),
              child: Icon(Icons.add_a_photo,
                  color: Theme.of(context).colorScheme.secondary),
            ),
          ),
        ],
      ),
    );
  }

  void _clearTextControllers() {
    _recipeInstructionsController.clear();
    _recipeDescriptionController.clear();
    _recipeIngredientsController.clear();
    _recipeNameController.clear();
  }
}

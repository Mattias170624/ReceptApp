import 'package:grupp_project/services/firebase/firebase_database.dart';
import 'package:grupp_project/widgets/category_gradient.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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

  @override
  Widget build(BuildContext context) {
    // getImage
    Future _getImage() async {
      final ImagePicker _picker = ImagePicker();
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = File(image!.path);
      });
    }

    Widget _recipeImage() {
      return Container(
        height: 200,
        width: double.infinity,
        child: Stack(
          children: [
            _image == null
                ? Image.network(
                    'https://media.self.com/photos/622912847b959736301bfb91/2:1/w_1280,c_limit/GettyImages-1301412050.jpg',
                    fit: BoxFit.cover,
                  )
                : Image.file(
                    _image!,
                    fit: BoxFit.cover,
                  ),
            Positioned(
              bottom: 10,
              right: 10,
              child: FloatingActionButton(
                onPressed: () => _getImage(),
                child: const Icon(Icons.add_a_photo),
              ),
            ),
          ],
        ),
      );
    }

    var items = [
      'Meat',
      'Soup',
      'Pasta',
      'Taco',
      'Pizza',
      'Dessert',
    ];

    Widget _dropdownMenu() {
      // use items as a dropdown menu and make it required
      // make the button wide enough to fit the screen
      // items in dropdown should appear horizontally

      return Container(
        width: double.infinity,
        child: DropdownButtonFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
          value: items[0],
          items: items.map((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _recipeCategoryController.text = value.toString();
            });
          },
        ),
      );
    }

    return Stack(
      children: [
        CategoryGradient(),
        SafeArea(
          child: Container(
            padding: EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    'Add a new recipe',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 24.0,
                    ),
                  ),
                ),
                // add _dropdownMenu()
                _recipeImage(),
                _dropdownMenu(),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _recipeNameController,
                        decoration: InputDecoration(
                          labelText: 'Recipe name',
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
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
                      TextFormField(
                        controller: _recipeDescriptionController,
                        decoration: InputDecoration(
                          labelText: 'Recipe description',
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
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
                      TextFormField(
                        controller: _recipeIngredientsController,
                        decoration: InputDecoration(
                          labelText: 'Recipe ingredients',
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a recipe ingredients';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _recipeInstructionsController,
                        decoration: InputDecoration(
                          labelText: 'Recipe instructions',
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a recipe instructions';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Processing Data'),
                          ),
                        );
                      }
                    },
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

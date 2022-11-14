class ItemModel {
  String id;
  final String category;
  final String image;
  final String name;
  final String description;
  final String ingredients;
  final String instructions;
  final bool isFav;

  ItemModel({
    this.id = '',
    required this.name,
    required this.description,
    required this.image,
    required this.category,
    required this.ingredients,
    required this.instructions,
    this.isFav = false,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'image': image,
        'category': category,
        'ingredients': ingredients,
        'instructions': instructions,
        'isFav': isFav,
      };
}

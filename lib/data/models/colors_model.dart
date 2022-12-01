class ColorsModel {
  String color_a;
  String color_b;

  ColorsModel({required this.color_a, required this.color_b});

  factory ColorsModel.fromJson(Map<String, dynamic> jsonData) {
    return ColorsModel(
      color_a: jsonData['color_a'] as String? ?? 'FFFFFF',
      color_b: jsonData['color_b'] as String? ?? 'FFFFFF',
    );
  }

  @override
  String toString() {
    return '''
    color_a: $color_a
    color_b: $color_b
    ''';
  }
}


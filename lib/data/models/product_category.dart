enum ProductCategory {
  none('None'),
  drink('Minuman'),
  food('Makanan'),
  desserts('dsserts');

  final String value;
  const ProductCategory(this.value);

  bool get isFood => this == ProductCategory.food;
  bool get isDrink => this == ProductCategory.drink;
  bool get isDesserts => this == ProductCategory.desserts;
}

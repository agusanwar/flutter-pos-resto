enum ProductCategory {
  none('All'),
  drink('Drink'),
  food('Food'),
  desserts('Dissert');

  final String value;
  const ProductCategory(this.value);

  bool get isDrink => this == ProductCategory.drink;
  bool get isFood => this == ProductCategory.food;
  bool get isDesserts => this == ProductCategory.desserts;
}

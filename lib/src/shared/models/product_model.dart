class ProductModel {
  String name;
  String unit;
  double quantity = 0;
  double price = 0;

  ProductModel(
    this.name,
    this.unit,
  ) {
    name = 'Produto $name';
    unit;
  }
}

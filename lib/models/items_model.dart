class ItemModel {
  String? name;
  String? desc;
  double? oldPrice;
  double? newPrice;
  int? discount;
  String? pic;
  int? isFav;

  ItemModel({
    this.name,
    this.desc,
    this.discount,
    this.oldPrice,
    this.newPrice,
    this.pic,
    this.isFav,
  });
}

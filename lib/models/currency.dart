class Currency {
  final String currencyName;
  final String currencySymbol;
 // final double price;

  Currency({
    required this.currencyName, 
    required this.currencySymbol, 
    //required this.price
    });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      currencyName: json['currency'],
      currencySymbol: json['code'],
     // price: json['rates'][0]['mid']
    );
  }

}
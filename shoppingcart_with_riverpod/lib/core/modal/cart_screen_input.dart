class CartScreenInput {
  CartScreenInput({
    required this.selectedProducts,
    required this.removeFromCart,
    required this.resetCart,
  });
  final List selectedProducts;
  final void Function(int) removeFromCart;
  final void Function() resetCart;
}
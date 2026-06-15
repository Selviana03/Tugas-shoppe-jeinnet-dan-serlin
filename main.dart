// Kelas dasar (Abstraction)
abstract class Item {
  String get name;
  double get price;
}

// Implementasi kelas Product
class Product implements Item {
  final String name;
  final double price;
  final String category;

  Product(this.name, this.price, this.category);
}

// Kelas untuk mengelola Keranjang
class Cart {
  List<Product> _items = [];

  void addItem(Product product) {
    _items.add(product);
  }

  double calculateTotal() {
    return _items.fold(0, (sum, item) => sum + item.price);
  }

  List<Product> get items => _items;
}

// Kelas untuk User
class User {
  String username;
  String userId;
  Cart cart = Cart();

  User(this.username, this.userId);
}

// Kelas sistem utama untuk mencetak laporan
class ShopeeSystem {
  static void printReceipt(User user) {
    double total = user.cart.calculateTotal();
    
    print("========================================");
    print("=== SISTEM PENJUALAN SHOPEE (OOP) =====");
    print("========================================\n");
    
    print("DATA USER");
    print("ID Akun  : ${user.userId}");
    print("Username : ${user.username}\n");
    
    print("DAFTAR BELANJA");
    for (var i = 0; i < user.cart.items.length; i++) {
      var item = user.cart.items[i];
      print("${i + 1}. ${item.name} (${item.category}) - Rp${item.price.toInt()}");
    }
    
    print("\nTOTAL PEMBAYARAN");
    print("Jumlah : Rp${total.toInt()}");
    print("\n========================================");
    print("Status : Pembayaran Berhasil.");
    print("Terima kasih telah berbelanja!");
  }
}

void main() {
  // Inisialisasi Data
  var user = User("Serlin & Jeinnet", "251410030-251410033");
  
  // Menambahkan produk ke keranjang
  user.cart.addItem(Product("Smartphone X", 5000000, "Elektronik"));
  user.cart.addItem(Product("Tas Kulit", 250000, "Fashion"));
  
  // Menampilkan Output
  ShopeeSystem.printReceipt(user);
}

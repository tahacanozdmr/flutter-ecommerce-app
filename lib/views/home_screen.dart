import 'package:calisma/components/product_item_tile.dart';
import 'package:calisma/models/products_model.dart';
import 'package:calisma/services/api_service.dart';
import 'package:calisma/views/cart_screen.dart';
import 'package:calisma/views/product_detail_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiService apiService = ApiService();
  List<Data> allProducts = [];
  bool isLoading = false;
  String errorMessage = "";
  Set<int> cartIds = {};

  Future<void> loadProducts() async {
    try {
      setState(() {
        isLoading = true;
      });

      final products = await apiService.fetchProducts();

      setState(() {
        allProducts = products.data ?? [];
      });
    } catch (e) {
      setState(() {
        errorMessage = "Failed to load products";
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    loadProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'Discover',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                      color: Color(0xFF6C5CE7),
                    ),
                  ),

                  const Spacer(),

                  IconButton(
                    icon: const Icon(Icons.shopping_bag_outlined),
                    color: const Color(0xFF6C5CE7),
                    iconSize: 32,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartScreen(
                            cartIds: cartIds,
                            products: allProducts,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(height: 8),

              const Text(
                'Find products you will love.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 14),

              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search products',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),

              SizedBox(height: 16),

              Container(
                height: 110,
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF6C5CE7), Color(0xFFA29BFE)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Summer Sale',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Up to 50% off selected items',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.local_offer_rounded,
                      color: Colors.white,
                      size: 42,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16),

              Expanded(
                child: GridView.builder(
                  itemCount: allProducts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.5,
                  ),
                  itemBuilder: (context, index) {
                    final product = allProducts[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailScreen(
                              product: product,
                              cartIds: cartIds,
                            ),
                          ),
                        );
                      },
                      child: ProductItemTile(product: product),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

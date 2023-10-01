part of '../search_page.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController? _searchController;
  int? productFound = ProductList.allProduct.length;
  late List<ProductModel> productList = ProductList.allProduct;
  @override
  void initState() {
    super.initState();

    _searchController = TextEditingController();
  }

  void searchBook(String query) {
    final productListSort = ProductList.allProduct.where((book) {
      final titleLower = book.name!.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      productList = productListSort;
      productFound = productListSort.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: 'search',
      ),
      body: Column(
        children: [
          _HeaderSection(
            searchController: _searchController,
            onSearchTap: () {},
            onChanged: searchBook,
            productFound: productFound,
          ),
          const SizedBox(height: Const.space15),
          _BodySection(
            itemCount: productList,
          ),
        ],
      ),
    );
  }
}

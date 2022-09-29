// ignore_for_file: sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:rick_and_morty_characters/src/presenter/pages/search_page.dart';
import 'favorites_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: currentPage);
  }

  setCurrentPage(pagina) {
    setState(() {
      currentPage = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        children: const [
          SearchPage(),
          FavoritesPage(),
        ],
        onPageChanged: setCurrentPage,
      ),
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: const Color(0xff7FD039),
        iconSize: 24.0,
        fixedColor: const Color(0xff318F42),
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Personagens',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favoritos'),
        ],
        onTap: (page) {
          pc.animateToPage(page,
              duration: const Duration(milliseconds: 400), curve: Curves.ease);
        },
      ),
    );
  }
}

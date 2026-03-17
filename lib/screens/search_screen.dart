import 'package:flutter/material.dart';
import 'package:news_app/widgets/recent_search.dart';
import 'package:news_app/search_news_provider.dart';
import 'package:news_app/themes/app_textstyle.dart';
import 'package:news_app/widgets/result_search.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchQuery = "";
  final FocusNode _focusNode = FocusNode();
  bool _isSearching = false;
  bool _showClearButton = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _showClearButton = _controller.text.isNotEmpty;
      });
    });
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          _isSearching = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_new),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      textInputAction: TextInputAction.search,
                      focusNode: _focusNode,
                      autofocus: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search_outlined),
                        suffixIcon: _showClearButton
                            ? IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  _controller.clear();
                                  _focusNode.requestFocus();
                                },
                              )
                            : null,
                        hintText: "Search About News...",
                        hintStyle: AppTextstyle.getBaseTextTheme.bodyLarge,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onSubmitted: (value) {
                        if (value.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please enter a search keyword!"),
                            ),
                          );
                          return;
                        }

                        _focusNode.unfocus();
                        setState(() {
                          _isSearching = true;
                          searchQuery = value;
                        });

                        context.read<SearchNewsProvider>().searchNews(value);
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  child: _isSearching
                      ? ResultSearch(query: searchQuery)
                      : RecentSearch(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

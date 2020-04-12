import 'package:flutter/material.dart';
import 'package:juejin_app/models/index.dart';
import 'package:juejin_app/widgets/book_list_cell.dart';
import '../util/dataUtils.dart';

class BookPageTabView extends StatefulWidget {
  final String alias;

  const BookPageTabView({Key key, this.alias}) : super(key: key);
  @override
  _BookPageTabViewState createState() => _BookPageTabViewState();
}

class _BookPageTabViewState extends State<BookPageTabView> {
  Map<String, dynamic> _params = {
    "uid": '',
    'client_id': '',
    'token': '',
    'src': 'web',
    'pageNum': 1
  };

  List<Book_cell> _bookList = <Book_cell>[];

  getBookList() {
    if (widget.alias == 'all') {
      _params['alias'] = '';
    } else {
      _params['alias'] = widget.alias;
    }
    DataUtils.getBookListData(_params).then((resultList) {
      if (this.mounted) {
        setState(() {
          _bookList = resultList;
        });
      }
    });
  }
  
  @override
  void initState() {
    getBookList();
    super.initState();
  }

  Widget _itemBuilder(context, index) {
    return BookListCell(bookcell: _bookList[index]);
  }

  @override
  Widget build(BuildContext context) {
    if (_bookList.length == 0) {
      return Center(
           child: CircularProgressIndicator(),
      );
    }
    return ListView.builder(
       itemBuilder: _itemBuilder,
       itemCount: _bookList.length,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:incident_reporting/src/common_widgets/src/images/common_indicator.dart';
import 'package:incident_reporting/src/model/country_model.dart';

import 'functions.dart';

const TextStyle _defaultItemTextStyle = TextStyle(fontSize: 16);
const TextStyle _defaultSearchInputStyle = TextStyle(fontSize: 16);
const String _kDefaultSearchHintText = 'Search Country Name, Code';
// const String countryCodePackageName = 'country_calling_code_picker';

class CountryPickerWidget extends StatefulWidget {
  /// This callback will be called on selection of a [Country].
  final ValueChanged<Country>? onSelected;

  /// [itemTextStyle] can be used to change the TextStyle of the Text in ListItem. Default is [_defaultItemTextStyle]
  final TextStyle itemTextStyle;

  /// [searchInputStyle] can be used to change the TextStyle of the Text in SearchBox. Default is [searchInputStyle]
  final TextStyle searchInputStyle;

  /// [searchInputDecoration] can be used to change the decoration for SearchBox.
  final InputDecoration? searchInputDecoration;

  /// Flag icon size (width). Default set to 32.
  final double flagIconSize;

  ///Can be set to `true` for showing the List Separator. Default set to `false`
  final bool showSeparator;

  ///Can be set to `true` for opening the keyboard automatically. Default set to `false`
  final bool focusSearchBox;

  ///This will change the hint of the search box. Alternatively [searchInputDecoration] can be used to change decoration fully.
  final String searchHintText;

  const CountryPickerWidget({
    Key? key,
    this.onSelected,
    this.itemTextStyle = _defaultItemTextStyle,
    this.searchInputStyle = _defaultSearchInputStyle,
    this.searchInputDecoration,
    this.searchHintText = _kDefaultSearchHintText,
    this.flagIconSize = 32,
    this.showSeparator = false,
    this.focusSearchBox = false,
  }) : super(key: key);

  @override
  _CountryPickerWidgetState createState() => _CountryPickerWidgetState();
}

class _CountryPickerWidgetState extends State<CountryPickerWidget> {
  List<Country> _list = [];
  List<Country> _filteredList = [];
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  Country? _currentCountry;

  void _onSearch(text) {
    if (text == null || text.isEmpty) {
      setState(() {
        _filteredList.clear();
        _filteredList.addAll(_list);
      });
    } else {
      setState(() {
        _filteredList = _list
            .where((element) =>
                element.name
                    .toLowerCase()
                    .contains(text.toString().toLowerCase()) ||
                element.phone
                    .toLowerCase()
                    .contains(text.toString().toLowerCase()) ||
                element.countryCode
                    .toLowerCase()
                    .startsWith(text.toString().toLowerCase()))
            .map((e) => e)
            .toList();
      });
    }
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    });
    loadList();
    super.initState();
  }

  void loadList() async {
    setState(() {
      _isLoading = true;
    });
    _list = await getCountries(context);
    // try {
    //   String? code = await FlutterSimCountryCode.simCountryCode;
    //   _currentCountry =
    //       _list.firstWhere((element) => element.countryCode == code);
    //   final country = _currentCountry;
    //   if (country != null) {
    //     _list.removeWhere((element) => element.phone == country.phone);
    //     _list.insert(0, country);
    //   }
    // } catch (e) {
    // } finally {
    setState(() {
      _filteredList = _list.map((e) => e).toList();
      _isLoading = false;
    });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: TextField(
            style: widget.searchInputStyle,
            autofocus: widget.focusSearchBox,
            decoration: widget.searchInputDecoration ??
                InputDecoration(
                  suffixIcon: Visibility(
                    visible: _controller.text.isNotEmpty,
                    child: InkWell(
                      child: const Icon(Icons.clear),
                      onTap: () => setState(() {
                        _controller.clear();
                        _filteredList.clear();
                        _filteredList.addAll(_list);
                      }),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  contentPadding: const EdgeInsets.only(
                      left: 16, right: 16, top: 8, bottom: 8),
                  hintText: widget.searchHintText,
                ),
            textInputAction: TextInputAction.done,
            controller: _controller,
            onChanged: _onSearch,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Expanded(
          child: _isLoading
              ? const Center(child: CommonIndicator())
              : ListView.separated(
                  padding: const EdgeInsets.only(top: 16),
                  controller: _scrollController,
                  itemCount: _filteredList.length,
                  separatorBuilder: (_, index) =>
                      widget.showSeparator ? const Divider() : Container(),
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: () {
                        widget.onSelected?.call(_filteredList[index]);
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                            bottom: 12, top: 12, left: 24, right: 24),
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              _filteredList[index].flag,
                              // package: countryCodePackageName,
                              width: widget.flagIconSize,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                                child: Text(
                              '${_filteredList[index].phone} ${_filteredList[index].name}',
                              style: widget.itemTextStyle,
                            )),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        )
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }
}

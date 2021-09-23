import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';

import '../action_bar.widget.dart';
import 'list_count_bar.widget.dart';
import 'list_extensions.dart';

typedef OnCheckboxValueChange<T> = void Function(T item, {required bool isSelected});
typedef CheckboxTileBuilder<T> = CheckboxListTile Function(T item, OnCheckboxValueChange<T> onChange,
    {required bool isChecked});

class ListWithToolbarWidget<T> extends StatefulWidget {
  final List<T> itemsList;
  final Widget Function(T item) itemBuilder;
  final CheckboxTileBuilder<T>? checkboxTileBuilder;
  final bool Function(String textSearch, T element)? searchFunction;
  final List<Widget> actions;
  final String? itemTranslationSingular;
  final String? itemTranslationPlural;

  const ListWithToolbarWidget({
    required this.itemsList,
    required this.itemBuilder,
    this.checkboxTileBuilder,
    this.searchFunction,
    this.actions = const [],
    this.itemTranslationSingular,
    this.itemTranslationPlural,
  });

  @override
  _ListWithToolbarWidgetState<T> createState() => _ListWithToolbarWidgetState<T>();
}

class _ListWithToolbarWidgetState<T> extends State<ListWithToolbarWidget<T>> {
  static const _searchDebounceTime = Duration(milliseconds: 320);
  bool isCheckBoxModeActive = false;
  Set<T> checkedItemsSet = <T>{};
  Timer? _debounce;
  FilterFunction<T>? searchFilter;

  bool get useCheckboxTileBuilder => isCheckBoxModeActive && widget.checkboxTileBuilder != null;

  void onSearchTextChanged(String text) {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }

    _debounce = Timer(_searchDebounceTime, () {
      setState(() {
        searchFilter = widget.itemsList.isNotEmpty ? (T item) => widget.searchFunction!(text, item) : null;
      });
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void toggleCheckBoxMode() {
    setState(() => isCheckBoxModeActive = !isCheckBoxModeActive);
  }

  void onCheckBoxChanged(T item, {required bool isSelected}) {
    setState(() {
      if (isSelected) {
        checkedItemsSet.add(item);
      } else {
        checkedItemsSet.remove(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredItems = widget.itemsList.applyFilters([searchFilter]);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ActionBarWidget(
          actions: widget.actions,
          onCheckBoxButtonPressed: () => toggleCheckBoxMode(),
          searchWidgetLabelText: "Buscar",
          onSearch: widget.searchFunction != null ? onSearchTextChanged : null,
        ),
        ListCountBarWidget(() => filteredItems.length.toString()),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: buildChildren(filteredItems),
          ),
        ),
      ],
    );
  }

  List<Widget> buildChildren(List<T> items) {
    return items.map((item) => buildItemTile(item)).toList();
  }

  Widget buildItemTile(T item) {
    return useCheckboxTileBuilder
        ? widget.checkboxTileBuilder!(item, onCheckBoxChanged, isChecked: checkedItemsSet.contains(item))
        : widget.itemBuilder(item);
  }
}

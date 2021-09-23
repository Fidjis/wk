import 'package:flutter/material.dart';
import 'package:wk/utils/app_colors.dart';
import 'package:wk/utils/app_sizes.dart';

import 'spacing.widget.dart';

class ActionBarWidget<T> extends StatefulWidget {
  final void Function()? onCheckBoxButtonPressed;
  final String? searchWidgetLabelText;
  final void Function(String searchText)? onSearch;
  final List<Widget> actions;

  const ActionBarWidget({
    this.searchWidgetLabelText,
    this.actions = const [],
    this.onCheckBoxButtonPressed,
    this.onSearch,
  });

  @override
  _ActionBarWidgetState<T> createState() => _ActionBarWidgetState<T>();
}

class _ActionBarWidgetState<T> extends State<ActionBarWidget<T>> {
  final searchTextController = TextEditingController();
  bool isSearchBarVisible = false;

  void enableSearch() {
    if (widget.onSearch != null) {
      setState(() => isSearchBarVisible = true);
    }
  }

  void disableSearch() {
    setState(() {
      searchTextController.text = '';
      isSearchBarVisible = false;
      widget.onSearch!(searchTextController.text);
    });
  }

  void _onSearchChange(String text) {
    if (widget.onSearch != null) {
      widget.onSearch!(text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final searchBar = Row(
      children: [
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => disableSearch(),
        ),
        SpacingWidget.small(),
        Expanded(
          child: TextFormField(
            autofocus: true,
            onChanged: (text) => _onSearchChange(text),
            controller: searchTextController,
            decoration: InputDecoration(
              hintText: widget.searchWidgetLabelText ?? "Buscar",
            ),
          ),
        ),
        SpacingWidget.small(),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () => enableSearch(),
        )
      ],
    );

    final defaultBar = Row(
      children: [
        IconButton(
          icon: const Icon(Icons.check_box_outlined, color: AppColors.secondary),
          onPressed: widget.onCheckBoxButtonPressed ?? () {},
        ),
        SpacingWidget.small(),
        IconButton(
          icon: const Icon(Icons.filter_list_outlined, color: AppColors.secondary),
          onPressed: () {},
        ),
        const Spacer(),
        ...widget.actions,
        SpacingWidget.small(),
        if (widget.onSearch != null)
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => enableSearch(),
          )
      ],
    );

    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPaddingSizes.small,
          vertical: AppPaddingSizes.xsmall,
        ),
        child: SizedBox(
          height: AppButtonSizes.normal,
          child: isSearchBarVisible ? searchBar : defaultBar,
        ),
      ),
    );
  }
}

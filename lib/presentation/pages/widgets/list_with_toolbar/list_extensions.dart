typedef FilterFunction<T> = bool Function(T item);

extension ListExtensions<T> on List<T> {
  List<T> applyFilters(List<FilterFunction<T>?> filters) {
    final validFilters = filters.where((filter) => filter != null).toList();
    if (validFilters.isEmpty) {
      return this;
    }

    final finalFilter = validFilters.reduce((accumulatedFilter, filter) {
      return (T item) => accumulatedFilter!(item) && filter!(item);
    });

    return where((item) => finalFilter!(item)).toList();
  }
}

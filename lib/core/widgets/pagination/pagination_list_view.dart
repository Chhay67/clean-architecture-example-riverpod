import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class PaginationList extends ConsumerStatefulWidget {

  const PaginationList({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.dataLoader,
    required this.hasMoreData,
    this.physics = const ClampingScrollPhysics(),
    this.shrinkWrap = false,
    this.loadingWidget = const CircularProgressIndicator(),
    this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    this.scrollDirection = Axis.vertical,
    this.separatorBuilder,
    this.onEmpty,
    this.hasError = false,
    this.errorWidget,
  });

  final Widget loadingWidget;
  final EdgeInsets? padding;
  final int itemCount;
  final IndexedWidgetBuilder? separatorBuilder;
  final IndexedWidgetBuilder itemBuilder;
  final Widget? onEmpty;
  final Future<void> Function() dataLoader;
  final ScrollPhysics? physics;
  final Axis scrollDirection;
  final bool shrinkWrap;
  final bool hasMoreData;
  final bool hasError;
  final Widget? errorWidget;

  @override
  ConsumerState createState() => _PaginationListState();
}

class _PaginationListState extends ConsumerState<PaginationList> {
  late ScrollController scrollController;
  int loadingState = 0;

  void scrollListener(ScrollController controller) {
    if (widget.hasError) {
      return;
    }
    if (controller.offset == controller.position.maxScrollExtent) {
      loadingState += 1;
      onLoadingMoreData();
    }
  }

  void onLoadingMoreData() async {
    if (loadingState > 1) return;
    if (widget.hasMoreData) {
      await widget.dataLoader.call();
      if (mounted) {
        loadingState = 0;
      }
    }
  }

  void initController() {
    scrollController = ScrollController();
    scrollController.addListener(() => scrollListener(scrollController));
  }

  @override
  void initState() {
    initController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.onEmpty != null && widget.itemCount == 0) {
      return widget.onEmpty!;
    }
    return ListView.separated(
      separatorBuilder: widget.separatorBuilder ??
          (context, index) => const SizedBox.shrink(),
      controller: scrollController,
      physics: widget.physics,
      padding: widget.padding,
      scrollDirection: widget.scrollDirection,
      shrinkWrap: widget.shrinkWrap,
      itemCount: widget.itemCount + 1,
      itemBuilder: (context, index) {
        if (index == widget.itemCount) {
          return _buildBottomLoadingWidget();
        }
        return widget.itemBuilder(context, index);
      },
    );
  }

  Widget _buildBottomLoadingWidget() {
    if (widget.hasError) {
      return widget.errorWidget ??
          IconButton(
            onPressed: () => widget.dataLoader(),
            icon: const Icon(Icons.refresh),
          );
    }
    return widget.hasMoreData
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: widget.loadingWidget),
          )
        : const SizedBox.shrink();
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaginationGridListView extends ConsumerStatefulWidget {
  const PaginationGridListView({
    super.key,
    required this.gridDelegate,
    required this.dataLoader,
    required this.itemCount,
    required this.itemBuilder,
    required this.hasMoreData,
    this.onEmpty,
    this.shrinkWrap = false,
    this.loadingWidget = const CircularProgressIndicator(),
    this.padding = const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
    this.physics = const ClampingScrollPhysics(),
    this.hasError = false,
    this.errorWidget,
    this.scrollDirection = Axis.vertical,

  });
  final SliverGridDelegate gridDelegate;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCount;
  final ScrollPhysics physics;
  final bool shrinkWrap;
  final Axis scrollDirection;
  final Widget loadingWidget;
  final EdgeInsets? padding;
  final Widget? onEmpty;
  final Future<void> Function() dataLoader;
  final bool hasMoreData;
  final bool hasError;
  final Widget? errorWidget;


  @override
  ConsumerState createState() => _PaginationGridListViewState();
}

class _PaginationGridListViewState extends ConsumerState<PaginationGridListView> {
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

    return Column(
      children: [
        Expanded(child: GridView.builder(
          scrollDirection: widget.scrollDirection,
          gridDelegate: widget.gridDelegate,
          shrinkWrap: widget.shrinkWrap,
          padding: widget.padding,
          controller: scrollController,
          physics: widget.physics,
          itemCount: widget.itemCount + 1,
          itemBuilder: (context, index) {
            if (index == widget.itemCount) {
              return _buildBottomLoadingWidget();
            }
            return widget.itemBuilder(context, index);
          },
        ),),
      ],
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

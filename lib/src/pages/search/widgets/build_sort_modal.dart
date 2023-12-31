part of '../search_page.dart';

class _BuildSortModal extends StatefulWidget {
  final ScrollController? scrollController;

  const _BuildSortModal({
    Key? key,
    this.scrollController,
  }) : super(key: key);

  @override
  __BuildSortModalState createState() => __BuildSortModalState();
}

class __BuildSortModalState extends State<_BuildSortModal> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<SearchProvider>(
      builder: (context, provider, snapshot) {
        return Material(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(Const.radius),
            topRight: Radius.circular(Const.radius),
          ),
          child: ListView(
            controller: widget.scrollController,
            children: [
              const SizedBox(height: Const.space8),
              Center(
                child: Container(
                  width: Screens.width(context) / 10,
                  height: 3,
                  decoration: BoxDecoration(
                    color: theme.hintColor.withOpacity(.5),
                    borderRadius: BorderRadius.circular(Const.radius),
                  ),
                ),
              ),
              const SizedBox(height: Const.space25),
              Row(
                children: [
                  const SizedBox(width: Const.margin),
                  AutoSizeText(
                    'sort',
                    style: theme.textTheme.headlineMedium,
                  ),
                  const Spacer(),
                  CustomTextButton(
                    label: 'close',
                    onTap: () => Get.back<dynamic>(),
                    textColor: theme.primaryColor,
                  ),
                  const SizedBox(width: Const.space12),
                ],
              ),
              Column(
                children: SortAndFilterList.sortList(context)
                    .asMap()
                    .entries
                    .map(
                      (e) => RadioListTile(
                        value: e.key,
                        groupValue: provider.sortSelected,
                        activeColor: theme.primaryColor,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: Const.margin,
                        ),
                        onChanged: (int? v) {
                          provider.sortSelected = v;
                        },
                        title: AutoSizeText(
                          e.value,
                          style: theme.textTheme.headlineSmall,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}

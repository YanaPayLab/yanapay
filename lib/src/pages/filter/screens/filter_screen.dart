part of '../filter_page.dart';

class FilterScreen extends StatefulWidget {
  final ScrollController? scrollController;

  const FilterScreen({
    Key? key,
    this.scrollController,
  }) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
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
            padding: const EdgeInsets.symmetric(horizontal: Const.margin),
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
                  AutoSizeText(
                    'filter',
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
              const SizedBox(height: Const.space15),
              AutoSizeText(
                'size',
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(height: Const.space8),
              Row(
                children: SortAndFilterList.sizeList
                    .asMap()
                    .entries
                    .map(
                      (e) => InkWell(
                        onTap: () {
                          provider.sizeSelected = e.key;
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: Const.space12),
                          child: AutoSizeText(
                            e.value,
                            style: theme.textTheme.headlineMedium!.copyWith(
                              color: (provider.sizeSelected == e.key)
                                  ? theme.primaryColor
                                  : null,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: Const.space15),
              AutoSizeText(
                'color',
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(height: Const.space8),
              Row(
                children: SortAndFilterList.colorList
                    .asMap()
                    .entries
                    .map(
                      (e) => InkWell(
                        onTap: () {
                          provider.colorSelected = e.key;
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: Const.space12),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: e.value,
                            child: (provider.colorSelected == e.key)
                                ? const Icon(
                                    FeatherIcons.check,
                                    color: Colors.white,
                                  )
                                : const SizedBox(),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: Const.space15),
              AutoSizeText(
                'categorias',
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(height: Const.space8),
              Wrap(
                children: SortAndFilterList.categoryList(context)
                    .asMap()
                    .entries
                    .map(
                      (e) => InkWell(
                        onTap: () {
                          provider.categorySelected = e.key;
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: Const.space12),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: Const.space15,
                              vertical: 5,
                            ),
                            margin: const EdgeInsets.only(bottom: Const.space8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: (provider.categorySelected == e.key)
                                    ? theme.primaryColor
                                    : theme.hintColor,
                              ),
                              borderRadius: BorderRadius.circular(Const.radius),
                              color: (provider.categorySelected == e.key)
                                  ? theme.primaryColor
                                  : theme.colorScheme.background,
                            ),
                            child: AutoSizeText(
                              e.value,
                              style: theme.textTheme.headlineSmall!.copyWith(
                                color: (provider.categorySelected == e.key)
                                    ? Colors.white
                                    : null,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: Const.space15),
              AutoSizeText(
                'brand',
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(height: Const.space8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: Const.space12),
                decoration: BoxDecoration(
                  color: theme.hintColor.withOpacity(.05),
                  borderRadius: BorderRadius.circular(Const.radius),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: provider.brandSelected,
                    elevation: 16,
                    style: theme.textTheme.bodyLarge,
                    isExpanded: true,
                    hint: AutoSizeText(
                      'select_brand',
                      style: theme.textTheme.bodyLarge,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        provider.brandSelected = newValue;
                      });
                    },
                    items: SortAndFilterList.brandList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: AutoSizeText(
                          value,
                          style: theme.textTheme.titleLarge,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'dart:async';

import 'package:agent_dart/agent_dart.dart';
import 'package:extended_sliver/extended_sliver.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:oktoast/oktoast.dart';
import 'package:recase/recase.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

import '../internal/extensions.dart';
import '../internal/hive.dart';
import '../internal/services.dart';
import '../internal/token.dart';
import '../widget/delegate.dart';
import '../widget/ripple_tap.dart';
import '../widget/simple_image.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with WidgetsBindingObserver {
  final _manager = TokenManager(TokenProvider(), USDTProvider());

  final _controller = TextEditingController(
    text: 'dnt7r-aa7ub-2ptq7-t7oqo-ndhjb-qyk6n-ltd35-e243a-3i7b5-5cez3-vae',
  );

  AsyncSnapshot _snapshot = const AsyncSnapshot.waiting();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _reloadValue();
  }

  void _reloadValue() {
    _snapshot = const AsyncSnapshot.waiting();
    setState(() {});
    _loadValues().then((value) {
      _snapshot = const AsyncSnapshot.withData(ConnectionState.done, null);
    }).catchError((e) {
      _snapshot = AsyncSnapshot.withError(ConnectionState.done, e);
    }).whenComplete(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  Future<void> _loadValues() {
    return _manager.refresh().then((value) {
      if (_manager.tokens.isNotEmpty) {
        return _loadBalance(false);
      }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _loadBalance(false);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final safePadding = MediaQuery.of(context).padding;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _loadValues,
        displacement: safePadding.top + 48.0,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: const Text('IC Token List'),
              actions: [
                IconButton(
                  onPressed: () async {
                    final principal = await Navigator.pushNamed(
                      context,
                      '/scan',
                    );
                    if (principal != null) {
                      _controller.text = principal.toString();
                      _loadBalance(false);
                    }
                  },
                  icon: const Icon(Icons.qr_code_scanner_rounded),
                ),
              ],
              leading: IconButton(
                onPressed: () {
                  _showSettingsModal(context);
                },
                icon: const Icon(Icons.settings),
              ),
              pinned: true,
              expandedHeight: 120.0,
            ),
            SliverPinnedToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.only(
                  left: 24.0,
                  right: 24.0,
                  top: 12.0,
                  bottom: 12.0,
                ),
                decoration: BoxDecoration(color: theme.scaffoldBackgroundColor),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    filled: true,
                    border: const UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      borderSide: BorderSide.none,
                    ),
                    labelText: 'Enter principal',
                    hintText:
                        'dnt7r-aa7ub-2ptq7-t7oqo-ndhjb-qyk6n-ltd35-e243a-3i7b5-5cez3-vae',
                    suffixIcon: ValueListenableBuilder(
                      builder: (context, value, child) {
                        if (value.text.isEmpty) {
                          return const SizedBox.shrink();
                        }
                        return Padding(
                          padding: const EdgeInsetsDirectional.only(end: 8.0),
                          child: IconButton(
                            onPressed: () {
                              _controller.text = '';
                            },
                            icon: const Icon(Icons.clear_rounded),
                          ),
                        );
                      },
                      valueListenable: _controller,
                    ),
                    prefixIcon: const Icon(Icons.verified_user_outlined),
                    prefixIconConstraints: const BoxConstraints(minWidth: 52.0),
                  ),
                ),
              ),
            ),
            if (_snapshot.connectionState == ConnectionState.waiting)
              const SliverFillRemaining(
                child: Align(
                  alignment: AlignmentDirectional(0.0, -0.5),
                  child: SizedBox(
                    width: 48.0,
                    height: 48.0,
                    child: CircularProgressIndicator(),
                  ),
                ),
              )
            else if (_snapshot.hasError)
              SliverFillRemaining(
                child: Align(
                  alignment: const AlignmentDirectional(0.0, -0.5),
                  child: RippleTap(
                    onTap: _reloadValue,
                    borderRadius: BorderRadius.circular(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'An error occurred, click to retry.',
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ),
              )
            else
              ValueListenableBuilder(
                valueListenable: _manager,
                builder: (context, manager, child) {
                  final tokens = manager.tokens;
                  if (tokens.isEmpty) {
                    return const SliverFillRemaining(
                      child: Align(
                        alignment: AlignmentDirectional(0.0, -0.5),
                        child: Text('No data'),
                      ),
                    );
                  }
                  return SliverPadding(
                    padding: const EdgeInsets.all(24.0),
                    sliver: SliverWaterfallFlow(
                      gridDelegate:
                          const SliverWaterfallFlowDelegateWithMinCrossAxisExtent(
                        minCrossAxisExtent: 320.0,
                        crossAxisSpacing: 12.0,
                        mainAxisSpacing: 12.0,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final token = tokens[index];
                          return RippleTap(
                            onTap: () {
                              unawaited(
                                Navigator.pushNamed(
                                  context,
                                  '/token',
                                  arguments: token,
                                ),
                              );
                            },
                            color: theme.colorScheme.primaryContainer,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16.0)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 12.0,
                              ),
                              child: ValueListenableBuilder(
                                valueListenable: token,
                                builder: (context, token, child) {
                                  return _buildTokenItem(token, theme);
                                },
                              ),
                            ),
                          );
                        },
                        childCount: tokens.length,
                      ),
                    ),
                  );
                },
              ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: safePadding.bottom + 24.0,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadBalance,
        tooltip: 'Refresh tokens balance',
        child: const Icon(Icons.refresh_rounded),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _loadBalance([bool toast = true]) {
    final Principal principal;
    try {
      principal = Principal.fromText(_controller.text);
      unawaited(_manager.tokens.map((e) => e.getBalance(principal)).wait());
    } catch (_) {
      if (toast) {
        showToast('Please enter the correct principal.');
      }
      rethrow;
    }
  }

  Widget _buildTokenItem(Token token, ThemeData theme) {
    return Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(999.0),
              child: SimpleImage(
                token.logo ?? '',
                width: 42.0,
                height: 42.0,
              ),
            ),
            if (token.loading)
              Container(
                width: 42.0,
                height: 42.0,
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: theme.canvasColor.withOpacity(0.9),
                  shape: BoxShape.circle,
                ),
                child: const CircularProgressIndicator(),
              ),
          ],
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                token.symbol,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleLarge?.copyWith(height: 1.25),
              ),
              Text(
                token.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium?.copyWith(height: 1.0),
              ),
            ],
          ),
        ),
        const SizedBox(width: 24.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '\$ ${token.formatBalanceWithUSDT}',
              style: theme.textTheme.titleLarge?.copyWith(height: 1.25),
            ),
            Text(
              token.formatBalance,
              style: theme.textTheme.bodyMedium?.copyWith(height: 1.0),
            ),
          ],
        ),
      ],
    );
  }

  void _showSettingsModal(BuildContext context) {
    showCupertinoModalBottomSheet(
      context: context,
      builder: (context) {
        final theme = Theme.of(context);
        return Material(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height * 0.618,
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Settings',
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 24.0),
                  Text(
                    'Theme Mode',
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8.0),
                  ValueListenableBuilder(
                    valueListenable: Hives.box.listenable(keys: ['theme_mode']),
                    builder: (context, box, child) {
                      return Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: ThemeMode.values.map(
                          (e) {
                            return ChoiceChip(
                              label: Text(e.name.pascalCase),
                              selected: e.name ==
                                  box.get(
                                    'theme_mode',
                                    defaultValue: ThemeMode.system.name,
                                  ),
                              onSelected: (bool selected) {
                                if (selected) {
                                  Hives.box.put('theme_mode', e.name);
                                }
                              },
                            );
                          },
                        ).toList(growable: false),
                      );
                    },
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'Theme Color',
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8.0),
                  ValueListenableBuilder(
                    valueListenable:
                        Hives.box.listenable(keys: ['theme_color']),
                    builder: (context, box, child) {
                      final color = Color(
                        box.get(
                          'theme_color',
                          defaultValue: Colors.blueAccent.value,
                        ),
                      );
                      return ColorPicker(
                        color: color,
                        padding: EdgeInsets.zero,
                        pickersEnabled: const <ColorPickerType, bool>{
                          ColorPickerType.both: false,
                          ColorPickerType.primary: true,
                          ColorPickerType.accent: true,
                          ColorPickerType.bw: false,
                          ColorPickerType.custom: true,
                          ColorPickerType.wheel: true,
                        },
                        pickerTypeTextStyle: theme.textTheme.labelLarge,
                        onColorChanged: (v) {
                          box.put('theme_color', v.value);
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).padding.bottom + 24.0,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

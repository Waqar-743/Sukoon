import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sukoon/core/content/app_content.dart';
import 'package:sukoon/core/state/app_state.dart';
import 'package:sukoon/shared/widgets/common_widgets.dart';

class GoalsScreen extends ConsumerWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final store = ref.watch(sukoonStoreProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(store.tr('Goals & habits', 'Goals & habits')),
        actions: [
          TextButton(
            onPressed: () => context.push('/goals/history'),
            child: Text(store.tr('History', 'History')),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/goals/habit/edit'),
        icon: const Icon(Icons.add),
        label: Text(store.tr('New habit', 'New habit')),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SukoonSectionCard(
            title: store.tr(
              'Build real-life replacements',
              'Asal zindagi ki replacements banao',
            ),
            subtitle: store.tr(
              'Habits should support you, not punish you.',
              'Habits tumhara sahara hon, saza nahin.',
            ),
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                MetricChip(
                  label: store.tr('Active habits', 'Active habits'),
                  value: '${store.habits.length}',
                ),
                MetricChip(
                  label: store.tr('Completed today', 'Completed today'),
                  value:
                      '${store.habits.where((habit) => store.isHabitDoneOn(habit, DateTime.now())).length}',
                ),
                MetricChip(
                  label: store.tr('Points', 'Points'),
                  value: '${store.totalPoints}',
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          if (store.habits.isEmpty)
            EmptyStateCard(
              title: store.tr('No habits yet', 'Abhi habits nahin'),
              message: store.tr(
                'Try one small, repeatable habit you can actually keep.',
                'Aisi chhoti habit se shuru karo jo waqai nibha sako.',
              ),
            )
          else
            for (final group in AppContent.habitCategories)
              if (store.habits.any((habit) => habit.category == group)) ...[
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    group,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                ...store.habits
                    .where((habit) => habit.category == group)
                    .map(
                      (habit) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          tileColor: Colors.white,
                          title: Text(habit.name),
                          subtitle: Text(
                            '${habit.frequency} · ${store.habitStreak(habit)} day streak',
                          ),
                          leading: Checkbox(
                            value: store.isHabitDoneOn(habit, DateTime.now()),
                            onChanged: (_) => ref
                                .read(sukoonStoreProvider)
                                .toggleHabitCompletion(habit, DateTime.now()),
                          ),
                          trailing: IconButton(
                            onPressed: () =>
                                context.push('/goals/habit/edit/${habit.id}'),
                            icon: const Icon(Icons.edit_outlined),
                          ),
                        ),
                      ),
                    ),
              ],
        ],
      ),
    );
  }
}

class HabitEditScreen extends ConsumerStatefulWidget {
  const HabitEditScreen({super.key, this.habitId});

  final int? habitId;

  @override
  ConsumerState<HabitEditScreen> createState() => _HabitEditScreenState();
}

class _HabitEditScreenState extends ConsumerState<HabitEditScreen> {
  final TextEditingController _nameController = TextEditingController();
  String _category = AppContent.habitCategories.first;
  String _frequency = AppContent.habitFrequencies.first;

  @override
  void initState() {
    super.initState();
    final store = ref.read(sukoonStoreProvider);
    final habit = widget.habitId == null
        ? null
        : store.habits.firstWhere((item) => item.id == widget.habitId);
    _nameController.text = habit?.name ?? '';
    _category = habit?.category ?? _category;
    _frequency = habit?.frequency ?? _frequency;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final store = ref.watch(sukoonStoreProvider);
    return Scaffold(
      appBar: AppBar(title: Text(store.tr('Habit', 'Habit'))),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: store.tr('Habit name', 'Habit name'),
            ),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            initialValue: _category,
            items: AppContent.habitCategories
                .map((item) => DropdownMenuItem(value: item, child: Text(item)))
                .toList(),
            onChanged: (value) =>
                setState(() => _category = value ?? _category),
            decoration: InputDecoration(
              labelText: store.tr('Category', 'Category'),
            ),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            initialValue: _frequency,
            items: AppContent.habitFrequencies
                .map((item) => DropdownMenuItem(value: item, child: Text(item)))
                .toList(),
            onChanged: (value) =>
                setState(() => _frequency = value ?? _frequency),
            decoration: InputDecoration(
              labelText: store.tr('Frequency', 'Frequency'),
            ),
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () async {
              if (_nameController.text.trim().isEmpty) return;
              await ref
                  .read(sukoonStoreProvider)
                  .upsertHabit(
                    id: widget.habitId,
                    name: _nameController.text,
                    category: _category,
                    frequency: _frequency,
                  );
              if (context.mounted) context.pop();
            },
            child: Text(store.tr('Save habit', 'Habit save karo')),
          ),
        ],
      ),
    );
  }
}

class GoalsHistoryScreen extends ConsumerWidget {
  const GoalsHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final store = ref.watch(sukoonStoreProvider);
    final today = DateUtils.dateOnly(DateTime.now());

    return Scaffold(
      appBar: AppBar(title: Text(store.tr('Habit history', 'Habit history'))),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          for (final habit in store.habits)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: SukoonSectionCard(
                title: habit.name,
                subtitle: '${habit.category} · ${habit.frequency}',
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(7, (index) {
                    final day = today.subtract(Duration(days: 6 - index));
                    final done = store.isHabitDoneOn(habit, day);
                    return Chip(
                      avatar: Icon(
                        done
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                        size: 18,
                      ),
                      label: Text(DateFormat.E().format(day)),
                    );
                  }),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

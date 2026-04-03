import { Bell, Wind, Smartphone, PenLine, Plus, CheckCircle2, Circle, Leaf, X, Edit2, Trash2, Clock, ChevronDown, ChevronUp, Flame, BarChart2, Volume2 } from 'lucide-react';
import { useState } from 'react';
import BottomNav from '../components/BottomNav';
import { Screen } from '../App';

type IconType = 'Wind' | 'Smartphone' | 'PenLine' | 'Leaf';

type Habit = {
  id: string;
  title: string;
  description?: string;
  createdAt: string;
  streak: number;
  completedToday: boolean;
  reminderTime?: string;
  reminderSound?: string;
  stats?: {
    weekly: number;
    monthly: number;
  };
  icon: IconType;
};

const IconMap = {
  Wind,
  Smartphone,
  PenLine,
  Leaf
};

const getNextMilestone = (streak: number) => {
  if (streak < 7) return 7;
  if (streak < 21) return 21;
  if (streak < 30) return 30;
  if (streak < 90) return 90;
  if (streak < 365) return 365;
  return Math.ceil((streak + 1) / 100) * 100;
};

export default function Goals({ onNavigate }: { onNavigate: (s: Screen) => void }) {
  const [habits, setHabits] = useState<Habit[]>([
    { id: '1', title: 'Deep Breathing', description: 'Take 10 deep breaths to center yourself and reduce stress.', createdAt: new Date(Date.now() - 86400000 * 56).toISOString(), streak: 56, completedToday: true, icon: 'Wind', reminderTime: '08:00', reminderSound: 'Zen Bell', stats: { weekly: 100, monthly: 95 } },
    { id: '2', title: 'No Social Media before 10 AM', description: 'Keep mornings distraction-free to improve focus.', createdAt: new Date(Date.now() - 86400000 * 12).toISOString(), streak: 12, completedToday: false, icon: 'Smartphone', stats: { weekly: 85, monthly: 70 } },
    { id: '3', title: 'Gratitude Journal', description: 'Write down 3 things you are grateful for today.', createdAt: new Date(Date.now() - 86400000 * 4).toISOString(), streak: 4, completedToday: false, icon: 'PenLine', reminderTime: '21:00', reminderSound: 'Soft Chime', stats: { weekly: 60, monthly: 60 } },
  ]);

  const [isModalOpen, setIsModalOpen] = useState(false);
  const [editingHabit, setEditingHabit] = useState<Habit | null>(null);
  const [expandedHabitId, setExpandedHabitId] = useState<string | null>(null);
  const [toastMessage, setToastMessage] = useState<string | null>(null);
  const [uncompleteConfirmId, setUncompleteConfirmId] = useState<string | null>(null);

  const [newTitle, setNewTitle] = useState('');
  const [newDescription, setNewDescription] = useState('');
  const [newReminder, setNewReminder] = useState('');
  const [newReminderSound, setNewReminderSound] = useState('Default');
  const [newIcon, setNewIcon] = useState<IconType>('Leaf');

  const soundOptions = ['Default', 'Zen Bell', 'Soft Chime', 'Nature', 'None'];

  const completedCount = habits.filter(h => h.completedToday).length;

  const openAddModal = () => {
    setEditingHabit(null);
    setNewTitle('');
    setNewDescription('');
    setNewReminder('');
    setNewReminderSound('Default');
    setNewIcon('Leaf');
    setIsModalOpen(true);
  };

  const openEditModal = (habit: Habit) => {
    setEditingHabit(habit);
    setNewTitle(habit.title);
    setNewDescription(habit.description || '');
    setNewReminder(habit.reminderTime || '');
    setNewReminderSound(habit.reminderSound || 'Default');
    setNewIcon(habit.icon);
    setIsModalOpen(true);
  };

  const saveHabit = () => {
    if (!newTitle.trim()) return;
    
    if (editingHabit) {
      setHabits(habits.map(h => h.id === editingHabit.id ? { ...h, title: newTitle, description: newDescription, reminderTime: newReminder, reminderSound: newReminderSound, icon: newIcon } : h));
    } else {
      setHabits([...habits, {
        id: Date.now().toString(),
        title: newTitle,
        description: newDescription,
        createdAt: new Date().toISOString(),
        streak: 0,
        completedToday: false,
        reminderTime: newReminder,
        reminderSound: newReminderSound,
        stats: { weekly: 0, monthly: 0 },
        icon: newIcon
      }]);
    }
    setIsModalOpen(false);
  };

  const deleteHabit = (id: string) => {
    setHabits(habits.filter(h => h.id !== id));
  };

  const showToast = (msg: string) => {
    setToastMessage(msg);
    setTimeout(() => setToastMessage(null), 3000);
  };

  const toggleHabit = (id: string) => {
    const habit = habits.find(h => h.id === id);
    if (!habit) return;

    if (!habit.completedToday) {
      setHabits(habits.map(h => {
        if (h.id === id) {
          return { ...h, completedToday: true, streak: h.streak + 1 };
        }
        return h;
      }));
      showToast(`Awesome! ${habit.title} streak extended to ${habit.streak + 1} days! 🔥`);
    } else {
      setUncompleteConfirmId(id);
    }
  };

  const confirmUncomplete = () => {
    if (!uncompleteConfirmId) return;
    setHabits(habits.map(h => {
      if (h.id === uncompleteConfirmId) {
        return { ...h, completedToday: false, streak: Math.max(0, h.streak - 1) };
      }
      return h;
    }));
    setUncompleteConfirmId(null);
  };

  const toggleExpand = (id: string) => {
    setExpandedHabitId(expandedHabitId === id ? null : id);
  };

  return (
    <div className="flex-1 flex flex-col bg-background pb-24 overflow-y-auto relative">
      <header className="flex justify-between items-center px-4 h-16 w-full bg-surface border-b border-neutral/10 sticky top-0 z-40">
        <div className="flex items-center gap-3">
          <div className="w-8 h-8 rounded-full overflow-hidden bg-neutral/10">
            <img className="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAO67wh2XWqz45sDVIO0jdkQMpepob5-jRv7S6J_SYAvgAtwvLPCkJtB5rzI60FDb_ahhMnsEHx6ZgAn_22U3mWvs7whkfjQ16prtjlZSfJVBTDIQ2BZsORXT_34uP_y_xR5p6CEJ0AfupLRUY9LI9e5Pyav776I6b3Sr-C3jjwYge2v8tET24VLDm1WfICm_oV1c60Bkj9vGNE-0bhYDpmCkwWp3sKHJKPA7Ik0jOdsvLDlB49UXK0v04plcQS4TivrIaCxSrT1Z8i" alt="Profile" />
          </div>
          <h1 className="text-2xl font-bold text-primary font-headline">Sukoon</h1>
        </div>
        <button className="w-10 h-10 flex items-center justify-center rounded-full hover:bg-neutral/5 transition-colors">
          <Bell className="text-neutral w-6 h-6" />
        </button>
      </header>

      <main className="max-w-2xl mx-auto px-4 py-6 space-y-8 w-full">
        <section className="bg-surface rounded-xl p-8 flex flex-col items-center shadow-sm border border-neutral/10">
          <div className="relative flex items-center justify-center w-[180px] h-[180px]">
            <svg className="w-full h-full transform -rotate-90">
              <circle cx="90" cy="90" r="80" fill="transparent" stroke="#F1E9E2" strokeWidth="12" />
              <circle cx="90" cy="90" r="80" fill="transparent" stroke="#C4891A" strokeWidth="12" strokeDasharray="502.6" strokeDashoffset={502.6 - (502.6 * (completedCount / Math.max(1, habits.length)))} strokeLinecap="round" className="transition-all duration-500" />
            </svg>
            <div className="absolute inset-0 flex flex-col items-center justify-center">
              <span className="text-5xl font-bold text-[#2A1F1A]">{habits.length > 0 ? Math.round((completedCount / habits.length) * 100) : 0}%</span>
              <span className="text-sm font-medium text-neutral tracking-wide uppercase">completed</span>
            </div>
          </div>
          <div className="mt-8 text-center space-y-2">
            <p className="text-[#2A1F1A] italic text-lg px-4">"You're building a beautiful consistency, Zayaan."</p>
            <p className="urdu-text text-tertiary text-sm leading-loose pt-2">سکون پانے کے لیے استقامت ضروری ہے</p>
          </div>

          <div className="w-full mt-6 pt-6 border-t border-neutral/10">
            <div className="flex justify-between items-center mb-4">
              <h3 className="text-sm font-bold text-[#2A1F1A]">Overall Trend (Last 7 Days)</h3>
              <BarChart2 className="w-4 h-4 text-neutral/40" />
            </div>
            <div className="flex items-end justify-between h-16 gap-2">
              {[60, 80, 100, 40, 80, 100, Math.round((completedCount / Math.max(1, habits.length)) * 100)].map((val, i) => (
                <div key={i} className="flex-1 flex flex-col items-center gap-1">
                  <div className="w-full bg-primary-light rounded-t-sm relative flex-1 flex items-end">
                    <div className="w-full bg-primary rounded-t-sm transition-all duration-500" style={{ height: `${val}%` }}></div>
                  </div>
                  <span className="text-[9px] text-neutral/50 font-medium">{['M','T','W','T','F','S','S'][i]}</span>
                </div>
              ))}
            </div>
          </div>
        </section>

        <section className="space-y-4">
          <div className="flex justify-between items-center px-1">
            <h2 className="text-[#2A1F1A] font-bold text-xl">Today's habits</h2>
            <span className="bg-primary-light text-primary font-bold px-3 py-1 rounded-full text-sm">{completedCount} / {habits.length}</span>
          </div>
          <div className="grid gap-4">
            {habits.map(habit => {
              const Icon = IconMap[habit.icon];
              const isExpanded = expandedHabitId === habit.id;
              const nextMilestone = getNextMilestone(habit.streak);
              const progressPercent = Math.min((habit.streak / nextMilestone) * 100, 100);

              return (
                <div key={habit.id} className="bg-surface rounded-xl shadow-sm border border-neutral/10 relative group overflow-hidden">
                  <div className="p-4 flex flex-col gap-3">
                    <div className="flex items-center justify-between">
                      <div className="flex items-center gap-4 flex-1 cursor-pointer" onClick={() => toggleExpand(habit.id)}>
                        <button onClick={(e) => { e.stopPropagation(); toggleHabit(habit.id); }} className="relative w-12 h-12 flex items-center justify-center shrink-0 active:scale-90 transition-transform">
                          <svg className="absolute w-full h-full transform -rotate-90">
                            <circle cx="24" cy="24" r="21" fill="transparent" stroke="#F1E9E2" strokeWidth="4" />
                            {habit.completedToday && (
                              <circle cx="24" cy="24" r="21" fill="transparent" stroke="#6B8F71" strokeWidth="4" strokeDasharray="131.9" strokeDashoffset="0" strokeLinecap="round" className="transition-all duration-300" />
                            )}
                          </svg>
                          <Icon className={habit.completedToday ? "text-secondary w-5 h-5" : "text-neutral/50 w-5 h-5"} />
                        </button>
                        <div className="flex-1 pr-2">
                          <div className="flex items-center gap-2">
                            <h3 className={`font-bold ${habit.completedToday ? 'text-[#2A1F1A]' : 'text-neutral'}`}>{habit.title}</h3>
                            {isExpanded ? <ChevronUp className="w-4 h-4 text-neutral/40" /> : <ChevronDown className="w-4 h-4 text-neutral/40" />}
                          </div>
                          <div className="flex items-center gap-2 mt-1.5">
                            <div className={`flex items-center gap-1 text-[11px] font-bold px-1.5 py-0.5 rounded-md ${habit.streak > 0 ? 'bg-orange-100 text-orange-600' : 'bg-neutral/10 text-neutral/60'}`}>
                              <Flame className="w-3 h-3" />
                              {habit.streak} Day{habit.streak !== 1 ? 's' : ''}
                            </div>
                            {habit.reminderTime && (
                              <div className="flex items-center gap-1 text-[11px] text-primary/80 bg-primary-light px-1.5 py-0.5 rounded-md">
                                <Clock className="w-3 h-3" />
                                {habit.reminderTime}
                              </div>
                            )}
                          </div>
                        </div>
                      </div>
                      <div className="flex items-center gap-1">
                        <button onClick={() => openEditModal(habit)} className="p-2 text-neutral/40 hover:text-primary transition-colors">
                          <Edit2 className="w-4 h-4" />
                        </button>
                        <button onClick={() => deleteHabit(habit.id)} className="p-2 text-neutral/40 hover:text-error transition-colors">
                          <Trash2 className="w-4 h-4" />
                        </button>
                        <button onClick={(e) => { e.stopPropagation(); toggleHabit(habit.id); }} className="ml-1 active:scale-90 transition-transform">
                          {habit.completedToday ? (
                            <CheckCircle2 className="text-secondary w-6 h-6" />
                          ) : (
                            <Circle className="text-neutral/30 w-6 h-6" />
                          )}
                        </button>
                      </div>
                    </div>
                    
                    <div className="w-full pl-[64px] pr-2 pb-1">
                      <div className="flex justify-between items-center mb-1.5">
                        <span className="text-[10px] text-neutral/50 font-medium uppercase tracking-wider">Milestone: {nextMilestone} Days</span>
                        <span className="text-[10px] text-secondary font-bold">{Math.round(progressPercent)}%</span>
                      </div>
                      <div className="w-full h-1.5 bg-neutral/10 rounded-full overflow-hidden">
                        <div className="h-full bg-secondary transition-all duration-500" style={{ width: `${progressPercent}%` }}></div>
                      </div>
                    </div>
                  </div>
                  
                  {isExpanded && (
                    <div className="px-4 pb-4 pt-3 border-t border-neutral/10 bg-neutral/5 animate-in slide-in-from-top-2 duration-200">
                      {habit.description ? (
                        <p className="text-sm text-neutral/80 mb-3">{habit.description}</p>
                      ) : (
                        <p className="text-sm text-neutral/40 italic mb-3">No description provided.</p>
                      )}

                      <div className="mt-4 pt-4 border-t border-neutral/10 grid grid-cols-2 gap-4 mb-4">
                        <div>
                          <span className="text-[10px] text-neutral/50 uppercase tracking-wider font-bold block mb-1.5">7-Day Completion</span>
                          <div className="flex items-center gap-2">
                            <div className="flex-1 h-1.5 bg-neutral/10 rounded-full overflow-hidden">
                              <div className="h-full bg-primary" style={{ width: `${habit.stats?.weekly || 0}%` }}></div>
                            </div>
                            <span className="text-xs font-bold text-neutral">{habit.stats?.weekly || 0}%</span>
                          </div>
                        </div>
                        <div>
                          <span className="text-[10px] text-neutral/50 uppercase tracking-wider font-bold block mb-1.5">30-Day Completion</span>
                          <div className="flex items-center gap-2">
                            <div className="flex-1 h-1.5 bg-neutral/10 rounded-full overflow-hidden">
                              <div className="h-full bg-primary" style={{ width: `${habit.stats?.monthly || 0}%` }}></div>
                            </div>
                            <span className="text-xs font-bold text-neutral">{habit.stats?.monthly || 0}%</span>
                          </div>
                        </div>
                      </div>

                      <div className="flex items-center justify-between text-xs text-neutral/50">
                        <span>Created: {new Date(habit.createdAt).toLocaleDateString(undefined, { year: 'numeric', month: 'short', day: 'numeric' })}</span>
                        {habit.reminderSound && habit.reminderSound !== 'None' && (
                          <div className="flex items-center gap-1">
                            <Volume2 className="w-3 h-3" />
                            <span>{habit.reminderSound}</span>
                          </div>
                        )}
                      </div>
                    </div>
                  )}
                </div>
              );
            })}
            
            {habits.length === 0 && (
              <div className="text-center py-8 text-neutral/60 italic">
                No habits yet. Add one to start your journey.
              </div>
            )}
          </div>
        </section>
      </main>

      <button onClick={openAddModal} className="fixed bottom-24 right-6 w-14 h-14 bg-primary text-white rounded-full shadow-lg flex items-center justify-center hover:scale-105 active:scale-95 transition-transform z-40">
        <Plus className="w-6 h-6" />
      </button>

      {isModalOpen && (
        <div className="fixed inset-0 bg-black/40 backdrop-blur-sm z-50 flex items-center justify-center p-4">
          <div className="bg-surface w-full max-w-sm rounded-2xl p-6 shadow-2xl relative animate-in fade-in zoom-in duration-200">
            <button onClick={() => setIsModalOpen(false)} className="absolute top-4 right-4 text-neutral/50 hover:text-[#2A1F1A]">
              <X className="w-5 h-5" />
            </button>
            <h2 className="text-xl font-bold text-[#2A1F1A] mb-6 font-headline">{editingHabit ? 'Edit Habit' : 'New Habit'}</h2>
            
            <div className="space-y-4">
              <div>
                <label className="block text-xs font-bold text-neutral uppercase tracking-wider mb-2">Habit Name</label>
                <input 
                  type="text" 
                  value={newTitle}
                  onChange={(e) => setNewTitle(e.target.value)}
                  placeholder="e.g. Read 10 pages"
                  className="w-full bg-background border border-neutral/20 rounded-xl px-4 py-3 focus:ring-2 focus:ring-primary focus:border-primary outline-none transition-all"
                />
              </div>

              <div>
                <label className="block text-xs font-bold text-neutral uppercase tracking-wider mb-2">Description (Optional)</label>
                <textarea 
                  value={newDescription}
                  onChange={(e) => setNewDescription(e.target.value)}
                  placeholder="Why is this habit important to you?"
                  rows={2}
                  className="w-full bg-background border border-neutral/20 rounded-xl px-4 py-3 focus:ring-2 focus:ring-primary focus:border-primary outline-none transition-all resize-none"
                />
              </div>
              
              <div>
                <label className="block text-xs font-bold text-neutral uppercase tracking-wider mb-2">Icon</label>
                <div className="flex gap-3">
                  {(Object.keys(IconMap) as IconType[]).map(iconName => {
                    const Icon = IconMap[iconName];
                    return (
                      <button 
                        key={iconName}
                        onClick={() => setNewIcon(iconName)}
                        className={`w-12 h-12 rounded-xl flex items-center justify-center transition-all ${newIcon === iconName ? 'bg-primary-light border-2 border-primary text-primary-dark' : 'bg-background border border-neutral/20 text-neutral hover:bg-neutral/5'}`}
                      >
                        <Icon className="w-6 h-6" />
                      </button>
                    );
                  })}
                </div>
              </div>

              <div>
                <label className="block text-xs font-bold text-neutral uppercase tracking-wider mb-2">Reminder Time (Optional)</label>
                <input 
                  type="time" 
                  value={newReminder}
                  onChange={(e) => setNewReminder(e.target.value)}
                  className="w-full bg-background border border-neutral/20 rounded-xl px-4 py-3 focus:ring-2 focus:ring-primary focus:border-primary outline-none transition-all"
                />
              </div>

              <div>
                <label className="block text-xs font-bold text-neutral uppercase tracking-wider mb-2">Reminder Sound</label>
                <div className="relative">
                  <select 
                    value={newReminderSound}
                    onChange={(e) => setNewReminderSound(e.target.value)}
                    className="w-full bg-background border border-neutral/20 rounded-xl px-4 py-3 focus:ring-2 focus:ring-primary focus:border-primary outline-none transition-all appearance-none"
                  >
                    {soundOptions.map(s => <option key={s} value={s}>{s}</option>)}
                  </select>
                  <ChevronDown className="absolute right-4 top-1/2 -translate-y-1/2 w-4 h-4 text-neutral/40 pointer-events-none" />
                </div>
              </div>
            </div>

            <button 
              onClick={saveHabit}
              disabled={!newTitle.trim()}
              className="w-full mt-8 bg-primary text-white font-bold py-3.5 rounded-xl shadow-lg shadow-primary/20 active:scale-95 transition-transform disabled:opacity-50 disabled:active:scale-100"
            >
              {editingHabit ? 'Save Changes' : 'Add Habit'}
            </button>
          </div>
        </div>
      )}

      {/* Toast Notification */}
      {toastMessage && (
        <div className="fixed top-20 left-1/2 -translate-x-1/2 z-50 animate-in slide-in-from-top-4 fade-in duration-300">
          <div className="bg-[#2A1F1A] text-white px-6 py-3 rounded-full shadow-xl flex items-center gap-3">
            <Flame className="w-5 h-5 text-orange-400" />
            <span className="text-sm font-medium">{toastMessage}</span>
          </div>
        </div>
      )}

      {/* Uncomplete Confirmation Modal */}
      {uncompleteConfirmId && (
        <div className="fixed inset-0 bg-black/40 backdrop-blur-sm z-50 flex items-center justify-center p-4 animate-in fade-in duration-200">
          <div className="bg-surface w-full max-w-sm rounded-2xl p-6 shadow-2xl relative animate-in zoom-in-95 duration-200">
            <h2 className="text-xl font-bold text-[#2A1F1A] mb-2 font-headline">Reset Streak?</h2>
            <p className="text-neutral/80 text-sm mb-6">
              Are you sure you want to mark this habit as incomplete? You will lose today's progress and your streak will decrease.
            </p>
            <div className="flex gap-3">
              <button 
                onClick={() => setUncompleteConfirmId(null)}
                className="flex-1 py-3 rounded-xl font-bold text-neutral bg-neutral/10 hover:bg-neutral/20 transition-colors"
              >
                Cancel
              </button>
              <button 
                onClick={confirmUncomplete}
                className="flex-1 py-3 rounded-xl font-bold text-white bg-error hover:bg-error/90 shadow-lg shadow-error/20 transition-colors"
              >
                Yes, reset
              </button>
            </div>
          </div>
        </div>
      )}

      <BottomNav currentScreen="goals" onNavigate={onNavigate} />
    </div>
  );
}

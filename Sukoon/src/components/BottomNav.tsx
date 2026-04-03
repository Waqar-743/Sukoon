import { Home, Smile, PenLine, Target, TimerOff } from 'lucide-react';
import { Screen } from '../App';

interface BottomNavProps {
  currentScreen: Screen;
  onNavigate: (screen: Screen) => void;
}

export default function BottomNav({ currentScreen, onNavigate }: BottomNavProps) {
  const navItems = [
    { id: 'home', icon: Home, label: 'Home' },
    { id: 'mood', icon: Smile, label: 'Mood' },
    { id: 'journal', icon: PenLine, label: 'Journal' },
    { id: 'goals', icon: Target, label: 'Goals' },
    { id: 'detox', icon: TimerOff, label: 'Detox' },
  ] as const;

  return (
    <nav className="absolute bottom-0 left-0 w-full z-50 bg-background flex justify-around items-center px-2 py-3 pb-safe rounded-t-2xl border-t border-primary/10 shadow-[0_-4px_20px_rgba(0,0,0,0.05)]">
      {navItems.map((item) => {
        const isActive = currentScreen === item.id;
        const Icon = item.icon;
        return (
          <button
            key={item.id}
            onClick={() => onNavigate(item.id as Screen)}
            className={`flex flex-col items-center justify-center px-3 py-1.5 rounded-xl transition-all duration-200 active:scale-95 ${
              isActive ? 'bg-primary text-white' : 'text-neutral/60 hover:text-primary'
            }`}
          >
            <Icon className="w-6 h-6 mb-1" strokeWidth={isActive ? 2.5 : 2} />
            <span className="font-label text-[10px] uppercase tracking-wider font-medium">{item.label}</span>
          </button>
        );
      })}
    </nav>
  );
}

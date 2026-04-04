import { Home, Smile, PenLine, Target, TimerOff } from 'lucide-react';
import { motion } from 'motion/react';
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
    <nav className="premium-footer absolute bottom-2 left-3 right-3 z-50 flex justify-around items-center px-2 py-2 rounded-2xl">
      {navItems.map((item) => {
        const isActive = currentScreen === item.id;
        const Icon = item.icon;
        return (
          <motion.button
            key={item.id}
            onClick={() => onNavigate(item.id as Screen)}
            whileTap={{ scale: 0.94 }}
            whileHover={{ y: -2 }}
            transition={{ type: 'spring', stiffness: 520, damping: 32 }}
            className={`interactive-lift group relative flex flex-col items-center justify-center min-w-[56px] px-3 py-1.5 rounded-xl transition-all duration-250 active:scale-95 ${
              isActive
                ? 'bg-primary text-white shadow-[0_8px_20px_rgba(153,69,40,0.34)]'
                : 'text-neutral/65 hover:text-primary hover:bg-white/60'
            }`}
          >
            {isActive && (
              <motion.span
                layoutId="active-nav-pill"
                className="absolute inset-0 rounded-xl bg-primary"
                transition={{ type: 'spring', stiffness: 500, damping: 38 }}
              />
            )}
            <span className={`icon-box w-9 h-9 mb-1 relative z-10 ${isActive ? 'bg-[#F7E9E1] border-[#B15937]/45 shadow-[0_6px_14px_rgba(42,31,26,0.16)]' : 'group-hover:bg-white'}`}>
              <Icon className={`w-5 h-5 ${isActive ? 'text-[#2A1F1A]' : ''}`} strokeWidth={isActive ? 2.5 : 2} />
            </span>
            <span className="font-label text-[10px] uppercase tracking-wider font-semibold relative z-10">{item.label}</span>
          </motion.button>
        );
      })}
    </nav>
  );
}

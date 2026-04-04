import { Siren, Smile, Meh, Frown, Angry, Flame, CheckCircle2, TimerOff, Leaf, PenLine, Plus } from 'lucide-react';
import { motion } from 'motion/react';
import { useEffect, useRef, useState, type UIEvent } from 'react';
import BottomNav from '../components/BottomNav';
import { Screen } from '../App';

export default function Home({ onNavigate, userName }: { onNavigate: (s: Screen) => void, userName: string }) {
  const displayName = userName.trim() || 'Friend';
  const [headerVisible, setHeaderVisible] = useState(true);
  const [currentTime, setCurrentTime] = useState(() => new Date());
  const lastScrollTopRef = useRef(0);

  useEffect(() => {
    const timer = window.setInterval(() => {
      setCurrentTime(new Date());
    }, 60000);

    return () => window.clearInterval(timer);
  }, []);

  const hour = currentTime.getHours();
  const greetingLine =
    hour >= 5 && hour < 12
      ? 'Good morning - how did you sleep?'
      : hour >= 12 && hour < 17
        ? 'Good afternoon - how is your day going?'
        : hour >= 17 && hour < 22
          ? 'Good evening - how are you unwinding?'
          : 'Good night - how are you feeling right now?';

  const handleFeedScroll = (event: UIEvent<HTMLDivElement>) => {
    const currentScrollTop = event.currentTarget.scrollTop;

    if (currentScrollTop > lastScrollTopRef.current + 8 && currentScrollTop > 40) {
      setHeaderVisible(false);
    } else if (currentScrollTop < lastScrollTopRef.current - 8 || currentScrollTop <= 12) {
      setHeaderVisible(true);
    }

    lastScrollTopRef.current = currentScrollTop;
  };

  const moodButtons = [
    { icon: Smile, bg: 'bg-secondary-light', color: 'text-secondary' },
    { icon: Smile, bg: 'bg-surface', color: 'text-primary' },
    { icon: Meh, bg: 'bg-surface', color: 'text-primary' },
    { icon: Frown, bg: 'bg-tertiary-light', color: 'text-tertiary' },
    { icon: Angry, bg: 'bg-error-light', color: 'text-error' },
  ] as const;

  return (
    <div onScroll={handleFeedScroll} className="scrollable-panel flex-1 h-full min-h-0 flex flex-col bg-background/65 pb-24 no-scrollbar">
      <header className={`sticky top-0 left-0 w-full z-40 bg-background/78 backdrop-blur-xl shadow-sm px-6 py-4 flex items-center justify-between transition-transform duration-300 ${headerVisible ? 'translate-y-0' : '-translate-y-full'}`}>
        <div className="flex flex-col">
          <span className="text-[12px] text-neutral font-medium urdu-text leading-none">Assalam-o-Alaikum</span>
          <div className="flex items-baseline gap-2">
            <h1 className="font-headline font-bold text-[22px] text-[#2A1F1A]">{displayName}</h1>
            <span className="text-[13px] text-neutral font-normal">{greetingLine}</span>
          </div>
        </div>
        <div className="icon-box w-11 h-11 rounded-full overflow-hidden border-primary/20">
          <img className="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBhDZIHWVqfYz6He7iIxBdVX4uOWsUs4H7poOLLRglpcKEJdOlBtjAyZfRAbeO7vTQ-474Q-uXysNW8s2D_tdsCT2ft-lS0HDRO0zqfBmFMq9Z2M16g0cVMcpzPh47Wj9e3oEqpUZo-1-xzHE2cwXBEsnGn8YZksM79mBCwgECRJjVmV8hLQaKbz2knC7OQ4dJUhwzsjqk7erocPaEcQu2K-G1sLSZvrQQFQwRE7oNCylutHUSH8Tu8nEW-A7Xb2WTwFEnS1nZXt1_t" alt="Profile" />
        </div>
      </header>

      <main className="pt-6 px-6 space-y-8">
        <section className="premium-card bg-error-light/85 border border-error/20 rounded-xl p-4 flex items-center justify-between">
          <div className="flex items-center gap-3">
            <Siren className="text-error w-6 h-6" />
            <p className="text-error font-medium text-sm">Feeling overwhelmed? You are not alone.</p>
          </div>
          <button className="border border-error text-error text-[10px] font-bold uppercase tracking-wider px-3 py-1.5 rounded-lg hover:bg-error/5 transition-colors">
            Emergency Kit
          </button>
        </section>

        <section className="premium-card bg-primary-light/85 border border-primary/30 rounded-2xl p-6">
          <h2 className="text-[#2A1F1A] font-medium text-base mb-6">How are you feeling right now?</h2>
          <div className="flex justify-between items-center">
            {moodButtons.map((item, index) => {
              const Icon = item.icon;
              return (
                <motion.button
                  key={`${item.color}-${index}`}
                  onClick={() => onNavigate('mood')}
                  whileTap={{ scale: 0.9 }}
                  whileHover={{ y: -2, scale: 1.04 }}
                  transition={{ type: 'spring', stiffness: 500, damping: 32 }}
                  className={`icon-box w-10 h-10 rounded-full ${item.bg}`}
                >
                  <Icon className={`${item.color} w-6 h-6`} />
                </motion.button>
              );
            })}
          </div>
        </section>

        <section className="grid grid-cols-3 gap-3">
          <div className="premium-card interactive-lift p-4 rounded-xl flex flex-col items-center text-center">
            <span className="icon-box w-10 h-10 mb-2"><Flame className="text-primary w-5 h-5" /></span>
            <span className="text-[10px] uppercase tracking-tighter text-neutral mb-1">Streak</span>
            <span className="text-sm font-bold text-primary">7 days</span>
          </div>
          <div className="premium-card interactive-lift p-4 rounded-xl flex flex-col items-center text-center">
            <span className="icon-box w-10 h-10 mb-2"><CheckCircle2 className="text-secondary w-5 h-5" /></span>
            <span className="text-[10px] uppercase tracking-tighter text-neutral mb-1">Habits</span>
            <span className="text-sm font-bold text-secondary">3 today</span>
          </div>
          <div className="premium-card interactive-lift p-4 rounded-xl flex flex-col items-center text-center">
            <span className="icon-box w-10 h-10 mb-2"><TimerOff className="text-tertiary w-5 h-5" /></span>
            <span className="text-[10px] uppercase tracking-tighter text-neutral mb-1">Detox</span>
            <span className="text-sm font-bold text-tertiary">45 min</span>
          </div>
        </section>

        <section>
          <h3 className="text-[11px] font-bold uppercase tracking-[0.15em] text-neutral mb-4 ml-1">Quick tools</h3>
          <div className="grid grid-cols-3 gap-3">
            <div className="interactive-lift h-20 bg-secondary-light rounded-xl flex flex-col items-center justify-center gap-1 cursor-pointer transition-all duration-300 shadow-sm border border-secondary/20">
              <span className="icon-box w-9 h-9"><Leaf className="text-secondary w-5 h-5" /></span>
              <span className="text-[12px] font-medium text-secondary">Breathe</span>
            </div>
            <div onClick={() => onNavigate('journal')} className="interactive-lift h-20 bg-primary-light rounded-xl flex flex-col items-center justify-center gap-1 cursor-pointer transition-all duration-300 shadow-sm border border-primary/20">
              <span className="icon-box w-9 h-9"><PenLine className="text-primary w-5 h-5" /></span>
              <span className="text-[12px] font-medium text-primary-dark">Journal</span>
            </div>
            <div onClick={() => onNavigate('detox')} className="interactive-lift h-20 bg-tertiary-light rounded-xl flex flex-col items-center justify-center gap-1 cursor-pointer transition-all duration-300 shadow-sm border border-tertiary/20">
              <span className="icon-box w-9 h-9"><TimerOff className="text-tertiary w-5 h-5" /></span>
              <span className="text-[12px] font-medium text-tertiary">Detox</span>
            </div>
          </div>
        </section>

        <section className="premium-card interactive-lift border-l-[3px] border-primary p-5 rounded-r-xl">
          <span className="text-[10px] font-bold uppercase tracking-widest text-neutral">Today's thought</span>
          <p className="mt-2 text-neutral italic leading-relaxed">"You don't have to see the whole staircase, just take the first step. Focus on one breath at a time today."</p>
        </section>

        <section>
          <div className="flex justify-between items-end mb-4">
            <h3 className="text-[12px] font-medium text-neutral">Your week</h3>
            <span className="text-[10px] text-secondary font-medium">Trending upwards</span>
          </div>
          <div className="h-20 w-full flex items-end justify-between px-2 bg-surface/50 rounded-xl py-4">
            {['M', 'T', 'W', 'T', 'F', 'S', 'S'].map((day, i) => {
              const colors = ['bg-tertiary', 'bg-secondary', 'bg-primary', 'bg-secondary', 'bg-secondary', 'bg-tertiary', 'bg-primary'];
              return (
                <div key={i} className="flex flex-col items-center gap-2">
                  <div className={`w-2.5 h-2.5 rounded-full ${colors[i]}`}></div>
                  <span className="text-[9px] text-neutral">{day}</span>
                </div>
              );
            })}
          </div>
        </section>
      </main>

      <div className="fixed bottom-24 right-6 z-40">
        <button onClick={() => onNavigate('mood')} className="interactive-lift w-14 h-14 bg-gradient-to-br from-primary-dark to-primary rounded-2xl flex items-center justify-center text-white shadow-[0_14px_24px_rgba(153,69,40,0.4)] hover:scale-105 active:scale-95 transition-transform ring-2 ring-white/50">
          <Plus className="w-8 h-8" />
        </button>
      </div>

      <BottomNav currentScreen="home" onNavigate={onNavigate} />
    </div>
  );
}

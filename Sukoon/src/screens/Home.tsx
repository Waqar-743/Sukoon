import { Siren, Smile, Meh, Frown, Angry, Flame, CheckCircle2, TimerOff, Leaf, PenLine, Plus } from 'lucide-react';
import BottomNav from '../components/BottomNav';
import { Screen } from '../App';

export default function Home({ onNavigate }: { onNavigate: (s: Screen) => void }) {
  return (
    <div className="flex-1 flex flex-col bg-background pb-24 overflow-y-auto">
      <header className="sticky top-0 left-0 w-full z-40 bg-background/85 backdrop-blur-xl shadow-sm px-6 py-4 flex items-center justify-between">
        <div className="flex flex-col">
          <span className="text-[12px] text-neutral font-medium urdu-text leading-none">Assalam-o-Alaikum</span>
          <div className="flex items-baseline gap-2">
            <h1 className="font-headline font-bold text-[22px] text-[#2A1F1A]">Zayaan</h1>
            <span className="text-[13px] text-neutral font-normal">Good morning — how did you sleep?</span>
          </div>
        </div>
        <div className="w-10 h-10 rounded-full overflow-hidden bg-surface border-2 border-primary/10">
          <img className="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBhDZIHWVqfYz6He7iIxBdVX4uOWsUs4H7poOLLRglpcKEJdOlBtjAyZfRAbeO7vTQ-474Q-uXysNW8s2D_tdsCT2ft-lS0HDRO0zqfBmFMq9Z2M16g0cVMcpzPh47Wj9e3oEqpUZo-1-xzHE2cwXBEsnGn8YZksM79mBCwgECRJjVmV8hLQaKbz2knC7OQ4dJUhwzsjqk7erocPaEcQu2K-G1sLSZvrQQFQwRE7oNCylutHUSH8Tu8nEW-A7Xb2WTwFEnS1nZXt1_t" alt="Profile" />
        </div>
      </header>

      <main className="pt-6 px-6 space-y-8">
        <section className="bg-error-light border border-error/20 rounded-xl p-4 flex items-center justify-between">
          <div className="flex items-center gap-3">
            <Siren className="text-error w-6 h-6" />
            <p className="text-error font-medium text-sm">Feeling overwhelmed? You are not alone.</p>
          </div>
          <button className="border border-error text-error text-[10px] font-bold uppercase tracking-wider px-3 py-1.5 rounded-lg hover:bg-error/5 transition-colors">
            Emergency Kit
          </button>
        </section>

        <section className="bg-primary-light border border-primary/30 rounded-2xl p-6">
          <h2 className="text-[#2A1F1A] font-medium text-base mb-6">How are you feeling right now?</h2>
          <div className="flex justify-between items-center">
            <button onClick={() => onNavigate('mood')} className="w-10 h-10 rounded-full bg-secondary-light flex items-center justify-center transition-transform active:scale-90">
              <Smile className="text-secondary w-6 h-6" />
            </button>
            <button onClick={() => onNavigate('mood')} className="w-10 h-10 rounded-full bg-surface flex items-center justify-center transition-transform active:scale-90">
              <Smile className="text-primary w-6 h-6" />
            </button>
            <button onClick={() => onNavigate('mood')} className="w-10 h-10 rounded-full bg-surface flex items-center justify-center transition-transform active:scale-90">
              <Meh className="text-primary w-6 h-6" />
            </button>
            <button onClick={() => onNavigate('mood')} className="w-10 h-10 rounded-full bg-tertiary-light flex items-center justify-center transition-transform active:scale-90">
              <Frown className="text-tertiary w-6 h-6" />
            </button>
            <button onClick={() => onNavigate('mood')} className="w-10 h-10 rounded-full bg-error-light flex items-center justify-center transition-transform active:scale-90">
              <Angry className="text-error w-6 h-6" />
            </button>
          </div>
        </section>

        <section className="grid grid-cols-3 gap-3">
          <div className="bg-surface border border-neutral/10 p-4 rounded-xl flex flex-col items-center text-center">
            <Flame className="text-primary mb-2 w-6 h-6" />
            <span className="text-[10px] uppercase tracking-tighter text-neutral mb-1">Streak</span>
            <span className="text-sm font-bold text-primary">7 days</span>
          </div>
          <div className="bg-surface border border-neutral/10 p-4 rounded-xl flex flex-col items-center text-center">
            <CheckCircle2 className="text-secondary mb-2 w-6 h-6" />
            <span className="text-[10px] uppercase tracking-tighter text-neutral mb-1">Habits</span>
            <span className="text-sm font-bold text-secondary">3 today</span>
          </div>
          <div className="bg-surface border border-neutral/10 p-4 rounded-xl flex flex-col items-center text-center">
            <TimerOff className="text-tertiary mb-2 w-6 h-6" />
            <span className="text-[10px] uppercase tracking-tighter text-neutral mb-1">Detox</span>
            <span className="text-sm font-bold text-tertiary">45 min</span>
          </div>
        </section>

        <section>
          <h3 className="text-[11px] font-bold uppercase tracking-[0.15em] text-neutral mb-4 ml-1">Quick tools</h3>
          <div className="grid grid-cols-3 gap-3">
            <div className="h-20 bg-secondary-light rounded-xl flex flex-col items-center justify-center gap-1 cursor-pointer hover:opacity-80 transition-opacity">
              <Leaf className="text-secondary w-6 h-6" />
              <span className="text-[12px] font-medium text-secondary">Breathe</span>
            </div>
            <div onClick={() => onNavigate('journal')} className="h-20 bg-primary-light rounded-xl flex flex-col items-center justify-center gap-1 cursor-pointer hover:opacity-80 transition-opacity">
              <PenLine className="text-primary w-6 h-6" />
              <span className="text-[12px] font-medium text-primary-dark">Journal</span>
            </div>
            <div onClick={() => onNavigate('detox')} className="h-20 bg-tertiary-light rounded-xl flex flex-col items-center justify-center gap-1 cursor-pointer hover:opacity-80 transition-opacity">
              <TimerOff className="text-tertiary w-6 h-6" />
              <span className="text-[12px] font-medium text-tertiary">Detox</span>
            </div>
          </div>
        </section>

        <section className="bg-surface border-l-[3px] border-primary p-5 rounded-r-xl shadow-sm">
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
        <button onClick={() => onNavigate('mood')} className="w-14 h-14 bg-gradient-to-br from-primary-dark to-primary rounded-2xl flex items-center justify-center text-white shadow-lg hover:scale-105 active:scale-95 transition-transform">
          <Plus className="w-8 h-8" />
        </button>
      </div>

      <BottomNav currentScreen="home" onNavigate={onNavigate} />
    </div>
  );
}

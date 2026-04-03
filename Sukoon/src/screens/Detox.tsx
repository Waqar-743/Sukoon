import { Settings, TimerOff, BarChart2, ArrowDown, Lightbulb, Leaf, Award, Flame, TrendingDown, Timer, Book, Sun, Lock } from 'lucide-react';
import BottomNav from '../components/BottomNav';
import { Screen } from '../App';

export default function Detox({ onNavigate }: { onNavigate: (s: Screen) => void }) {
  return (
    <div className="flex-1 flex flex-col bg-background pb-24 overflow-y-auto">
      <header className="bg-surface text-primary font-headline border-b border-neutral/10 flex justify-between items-center px-4 h-16 w-full sticky top-0 z-40">
        <div className="flex items-center gap-3">
          <div className="w-10 h-10 rounded-full overflow-hidden bg-primary-light border border-neutral/20">
            <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuB0TIuw4H2dw7xn6sGZnNCnwm58mdI8fv8-2E_O95HvnAHfg8NlCFDOCNSDh9lDp9hVIwEgPy9jrEy2U37EHtq115YdCJno9a9RHngNGcaaIKNY_Hkbaigl-gjFsjzAnxPTPy3kstffwWbW6SI_ZKOZfn9GdbKIGZl7t5nivpEt_6lB8E7qz_s2WjqliKALSDoY1Vf2065vCkFgK2PC5r14Q9_JWg9K4KWRJJdQ9HYzLCag8-C27XLR_zKYMBDSlopv6NvoijS96yXv" alt="Profile" className="w-full h-full object-cover" />
          </div>
          <h1 className="text-2xl font-bold text-primary">Sukoon</h1>
        </div>
        <button className="text-neutral/60 transition-colors duration-200 hover:bg-neutral/5 p-2 rounded-full">
          <Settings className="w-6 h-6" />
        </button>
      </header>

      <main className="max-w-2xl mx-auto p-4 space-y-6 w-full">
        <section className="flex justify-between items-end">
          <div>
            <p className="text-sm font-medium text-primary uppercase tracking-wider mb-1">digital detox</p>
            <h2 className="text-3xl font-bold font-headline text-[#2A1F1A] tracking-tight">Your Quiet Space</h2>
            <p className="text-neutral italic opacity-80 leading-relaxed">سکون: finding peace in the present.</p>
          </div>
          <div className="hidden md:block">
            <TimerOff className="w-10 h-10 text-primary opacity-20" />
          </div>
        </section>

        <section className="bg-surface rounded-xl shadow-sm border-l-[3px] border-secondary p-5">
          <div className="flex justify-between items-start mb-4">
            <div>
              <h3 className="text-xs font-semibold uppercase tracking-widest text-neutral mb-1">Today's Usage</h3>
              <div className="flex items-baseline gap-2">
                <span className="text-4xl font-bold font-headline text-[#2A1F1A]">4h 12m</span>
                <div className="flex items-center text-secondary text-sm font-semibold">
                  <ArrowDown className="w-4 h-4" />
                  <span>12%</span>
                </div>
              </div>
            </div>
            <BarChart2 className="text-neutral/30 w-6 h-6" />
          </div>
          <div className="flex items-center justify-between pt-4 border-t border-neutral/10">
            <div className="flex flex-col">
              <span className="text-xs text-neutral/70">Social Media</span>
              <span className="text-lg font-semibold text-neutral">1h 45m</span>
            </div>
            <div className="flex flex-col text-right">
              <span className="text-xs text-neutral/70">Avg. 5h 02m</span>
              <span className="text-sm font-medium text-secondary">Below average</span>
            </div>
          </div>
        </section>

        <section className="bg-primary-light border border-primary/20 rounded-xl p-5 flex items-start gap-4 shadow-sm">
          <div className="bg-surface p-2 rounded-lg text-primary shadow-inner">
            <Lightbulb className="w-5 h-5" />
          </div>
          <div>
            <p className="text-[#55433d] leading-relaxed">
              <span className="font-semibold block mb-1">Did you notice?</span>
              On heavy screen days, your mood averages <span className="text-primary font-bold">3.2/5</span>. Today is looking brighter at <span className="text-secondary font-bold">4.8/5</span>.
            </p>
            <p className="text-xs mt-2 text-primary/60 italic">Finding your flow, one moment at a time.</p>
          </div>
        </section>

        <section className="grid grid-cols-2 gap-4">
          <div className="bg-surface rounded-xl p-4 border border-neutral/10 flex flex-col items-center text-center">
            <div className="bg-secondary/10 p-3 rounded-full mb-3">
              <Leaf className="text-secondary w-6 h-6" />
            </div>
            <span className="text-2xl font-bold text-[#2A1F1A]">12</span>
            <span className="text-xs text-neutral">Mindful Sessions</span>
          </div>
          <div className="bg-surface rounded-xl p-4 border border-neutral/10 flex flex-col items-center text-center">
            <div className="bg-tertiary-light p-3 rounded-full mb-3">
              <Award className="text-tertiary w-6 h-6" />
            </div>
            <span className="text-2xl font-bold text-[#2A1F1A]">850</span>
            <span className="text-xs text-neutral">Detox Points</span>
          </div>
          <div className="bg-surface rounded-xl p-4 border border-neutral/10 flex flex-col items-center text-center">
            <div className="bg-primary-light p-3 rounded-full mb-3">
              <Flame className="text-primary w-6 h-6" />
            </div>
            <span className="text-2xl font-bold text-[#2A1F1A]">4 Days</span>
            <span className="text-xs text-neutral">Focus Streak</span>
          </div>
          <div className="bg-surface rounded-xl p-4 border border-neutral/10 flex flex-col items-center text-center">
            <div className="bg-secondary-light p-3 rounded-full mb-3">
              <TrendingDown className="text-secondary w-6 h-6" />
            </div>
            <span className="text-2xl font-bold text-[#2A1F1A]">-1.5h</span>
            <span className="text-xs text-neutral">vs. Last Week</span>
          </div>
        </section>

        <section className="space-y-4 pt-2">
          <h3 className="text-sm font-bold font-headline flex items-center gap-2 px-1">
            Start a focus session <span className="text-xs font-normal opacity-50 font-body">وقت سکون</span>
          </h3>
          
          <button className="w-full text-left bg-secondary-light border border-secondary/30 rounded-xl p-4 flex justify-between items-center group active:scale-95 transition-transform">
            <div className="flex items-center gap-4">
              <div className="bg-surface p-2 rounded-lg">
                <Timer className="text-secondary w-6 h-6" />
              </div>
              <div>
                <h4 className="font-bold text-[#2A1F1A]">Quick detox</h4>
                <div className="flex items-center gap-2 mt-1">
                  <span className="text-xs bg-surface/60 px-2 py-0.5 rounded border border-secondary/30">30 min</span>
                  <span className="text-xs font-bold text-tertiary">+30 pts</span>
                </div>
              </div>
            </div>
          </button>

          <button className="w-full text-left bg-primary-light border border-primary/30 rounded-xl p-4 flex justify-between items-center group active:scale-95 transition-transform relative overflow-hidden">
            <div className="flex items-center gap-4">
              <div className="bg-surface p-2 rounded-lg">
                <Book className="text-primary w-6 h-6" />
              </div>
              <div>
                <div className="flex items-center gap-2">
                  <h4 className="font-bold text-[#2A1F1A]">Study zone</h4>
                  <span className="text-[10px] font-bold text-white bg-primary px-1.5 py-0.5 rounded-sm">Most used</span>
                </div>
                <div className="flex items-center gap-2 mt-1">
                  <span className="text-xs bg-surface/60 px-2 py-0.5 rounded border border-primary/30">90 min</span>
                  <span className="text-xs font-bold text-tertiary">+100 pts</span>
                </div>
              </div>
            </div>
          </button>

          <button className="w-full text-left bg-tertiary-light border border-tertiary/30 rounded-xl p-4 flex justify-between items-center group active:scale-95 transition-transform">
            <div className="flex items-center gap-4">
              <div className="bg-surface p-2 rounded-lg">
                <Sun className="text-tertiary w-6 h-6" />
              </div>
              <div>
                <h4 className="font-bold text-[#2A1F1A]">Social-free morning</h4>
                <div className="flex items-center gap-2 mt-1">
                  <span className="text-xs bg-surface/60 px-2 py-0.5 rounded border border-tertiary/30">Morning block</span>
                  <span className="text-xs font-bold text-tertiary">+150 pts</span>
                </div>
              </div>
            </div>
          </button>

          <button className="w-full text-left bg-error-light border border-error/50 rounded-xl p-4 flex justify-between items-center group active:scale-95 transition-transform">
            <div className="flex items-center gap-4">
              <div className="bg-surface p-2 rounded-lg">
                <Lock className="text-error w-6 h-6" />
              </div>
              <div>
                <div className="flex items-center gap-2">
                  <h4 className="font-bold text-[#2A1F1A]">Social-free day</h4>
                  <span className="text-[10px] font-bold text-error bg-surface px-1.5 py-0.5 rounded-sm border border-error/50">Hardest · Most rewarding</span>
                </div>
                <div className="flex items-center gap-2 mt-1">
                  <span className="text-xs bg-surface/60 px-2 py-0.5 rounded border border-error/50">Full day</span>
                  <span className="text-xs font-bold text-tertiary">+400 pts</span>
                </div>
              </div>
            </div>
          </button>
        </section>
      </main>

      <BottomNav currentScreen="detox" onNavigate={onNavigate} />
    </div>
  );
}

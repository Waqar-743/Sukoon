import { ArrowLeft, CloudCheck, Lightbulb, Smile, Image as ImageIcon, Lock } from 'lucide-react';
import BottomNav from '../components/BottomNav';
import { Screen } from '../App';

export default function Journal({ onNavigate }: { onNavigate: (s: Screen) => void }) {
  return (
    <div className="flex-1 flex flex-col bg-surface pb-24">
      <header className="sticky top-0 w-full z-50 bg-surface border-b border-neutral/10 flex items-center justify-between px-4 h-16">
        <div className="flex items-center gap-3">
          <button onClick={() => onNavigate('home')} className="p-2 transition-colors duration-200 hover:bg-neutral/5 rounded-full">
            <ArrowLeft className="text-neutral w-6 h-6" />
          </button>
          <span className="font-headline font-bold text-2xl text-primary">Sukoon</span>
        </div>
        <div className="flex items-center gap-2 text-neutral/60 text-sm font-medium">
          <CloudCheck className="w-4 h-4" />
          <span>Saved</span>
        </div>
      </header>

      <main className="flex-1 flex flex-col">
        <section className="bg-primary-light px-6 py-4 flex items-center justify-between">
          <div className="flex items-center gap-3">
            <Lightbulb className="text-primary w-5 h-5" />
            <p className="text-primary-dark text-sm font-medium">What's one small thing that brought you peace today?</p>
          </div>
          <button className="text-xs font-semibold text-primary uppercase tracking-wider hover:opacity-70">Shuffle</button>
        </section>

        <article className="flex-grow bg-surface px-6 py-8 flex flex-col">
          <time className="text-neutral/50 text-xs font-semibold tracking-widest uppercase mb-4 block">Monday, 23 October</time>
          <input 
            type="text" 
            className="w-full font-headline font-bold text-3xl mb-6 border-none p-0 placeholder-neutral/30 text-[#2A1F1A] focus:ring-0 bg-transparent outline-none" 
            placeholder="Entry Title" 
          />
          <textarea 
            className="w-full flex-grow border-none p-0 resize-none text-lg leading-relaxed text-neutral placeholder-neutral/30 focus:ring-0 bg-transparent outline-none min-h-[300px]" 
            placeholder="Start writing your thoughts..."
          ></textarea>
        </article>

        <div className="px-4 py-3 bg-surface flex items-center justify-between border-t border-neutral/10 sticky bottom-20">
          <div className="flex gap-2">
            <button className="flex items-center gap-2 bg-background px-4 py-2 rounded-full text-sm font-medium text-neutral hover:bg-neutral/5 transition-colors border border-neutral/10">
              <Smile className="text-primary w-4 h-4" />
              <span>Peaceful</span>
            </button>
            <button className="p-2 text-neutral/50 hover:text-primary transition-colors">
              <ImageIcon className="w-5 h-5" />
            </button>
          </div>
          <div className="flex items-center gap-4 text-neutral/50 text-sm font-medium">
            <div className="flex items-center gap-1">
              <Lock className="w-4 h-4" />
              <span>Encrypted</span>
            </div>
            <div className="h-4 w-px bg-neutral/20"></div>
            <span>0 words</span>
          </div>
        </div>

        <footer className="px-6 py-4 flex flex-col items-center gap-1 text-neutral/50 mb-8">
          <p className="text-[10px] uppercase tracking-[0.2em] font-bold">Privacy Lock</p>
          <p className="text-xs">Your words stay on this device only.</p>
        </footer>
      </main>

      <BottomNav currentScreen="journal" onNavigate={onNavigate} />
    </div>
  );
}

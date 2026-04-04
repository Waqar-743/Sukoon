import { ArrowRight } from 'lucide-react';
import { motion } from 'motion/react';
import { useState } from 'react';

export default function OnboardingName({
  onNext,
  onSkip,
  initialName = '',
}: {
  onNext: (name: string) => void,
  onSkip: () => void,
  initialName?: string,
}) {
  const [name, setName] = useState(initialName);
  const [selectedType, setSelectedType] = useState('University student');

  return (
    <div className="flex-1 h-full min-h-0 flex flex-col bg-surface">
      <nav className="sticky top-0 flex items-center justify-between px-6 py-5 z-50 relative bg-surface/90 backdrop-blur-sm">
        <div className="w-12"></div>
        <div className="flex items-center gap-2">
          <div className="w-6 h-1.5 rounded-full bg-primary"></div>
          <div className="w-1.5 h-1.5 rounded-full bg-neutral/20"></div>
          <div className="w-1.5 h-1.5 rounded-full bg-neutral/20"></div>
        </div>
        <button onClick={onSkip} className="text-[14px] font-medium text-neutral px-2 py-1 active:opacity-60">
          Skip
        </button>
      </nav>

      <header className="relative h-[220px] sm:h-[260px] flex items-center justify-center shrink-0">
        <motion.div 
          initial={{ scale: 0.9, opacity: 0 }}
          animate={{ scale: 1, opacity: 1 }}
          transition={{ duration: 0.6 }}
          className="absolute inset-0 flex items-center justify-center"
        >
          <div className="relative w-56 h-56">
            <div className="absolute top-0 right-4 w-36 h-36 rounded-[2.5rem] bg-primary-light rotate-12 mix-blend-multiply opacity-80 animate-pulse"></div>
            <div className="absolute bottom-4 left-0 w-40 h-40 rounded-full bg-secondary-light mix-blend-multiply opacity-80 animate-pulse" style={{ animationDelay: '1s' }}></div>
            <div className="absolute top-10 left-12 w-28 h-44 rounded-[3rem] bg-primary-light -rotate-6 mix-blend-multiply opacity-70 animate-pulse" style={{ animationDelay: '2s' }}></div>
            <img alt="Sukoon Icon" className="relative z-10 w-full h-full object-contain drop-shadow-2xl" src="/Icon.png" />
          </div>
        </motion.div>
      </header>

      <motion.main 
        initial={{ y: 40, opacity: 0 }}
        animate={{ y: 0, opacity: 1 }}
        transition={{ duration: 0.5, delay: 0.2 }}
        className="scrollable-panel flex-1 min-h-0 flex flex-col px-6 pt-6 pb-[calc(1.5rem+env(safe-area-inset-bottom))] bg-white rounded-t-[2.5rem] relative z-20 shadow-[0_-10px_40px_rgba(0,0,0,0.05)]"
      >
        <div className="mb-8 text-center">
          <h1 className="text-[28px] font-headline font-bold text-[#2A1F1A] leading-tight mb-3">
            What should we call you?
          </h1>
          <p className="text-[15px] text-neutral/80">
            We will never share your name with anyone.
          </p>
        </div>

        <div className="space-y-8 flex-1">
          <div className="relative">
            <input 
              type="text" 
              value={name}
              onChange={(e) => setName(e.target.value)}
              onFocus={(e) => {
                e.currentTarget.scrollIntoView({ block: 'center', behavior: 'smooth' });
              }}
              placeholder="Your first name" 
              className="w-full h-[56px] px-5 bg-background border-2 border-transparent rounded-2xl text-on-surface placeholder-neutral/50 focus:bg-white focus:border-primary focus:ring-4 focus:ring-primary/10 outline-none transition-all text-lg font-medium shadow-sm"
            />
          </div>
          
          <div>
            <label className="block text-[13px] font-bold tracking-wider text-neutral uppercase mb-4 ml-1">
              I am a...
            </label>
            <div className="flex flex-wrap gap-3">
              {['Matric student', 'FSc student', 'University student', 'Competitive exam prep'].map((type) => {
                const isSelected = selectedType === type;
                return (
                  <button 
                    key={type} 
                    onClick={() => setSelectedType(type)}
                    className={`px-5 py-3.5 rounded-2xl text-[15px] font-medium transition-all active:scale-95 ${
                      isSelected 
                        ? 'bg-primary text-white shadow-md shadow-primary/20 scale-105' 
                        : 'bg-background text-neutral hover:bg-neutral/5 border border-neutral/10'
                    }`}
                  >
                    {type}
                  </button>
                );
              })}
            </div>
          </div>
        </div>

        <footer className="mt-8 pt-4">
          <button 
            onClick={() => onNext(name.trim())}
            disabled={!name.trim()}
            className="w-full h-14 bg-primary rounded-2xl flex items-center justify-center gap-2 active:scale-[0.98] shadow-lg shadow-primary/25 transition-all disabled:opacity-50 disabled:active:scale-100 disabled:shadow-none"
          >
            <span className="text-white font-bold tracking-wide text-lg">Continue</span>
            <ArrowRight className="text-white w-5 h-5" />
          </button>
        </footer>
      </motion.main>
    </div>
  );
}

import { ArrowLeft, ArrowRight } from 'lucide-react';
import { useState } from 'react';

export default function OnboardingIssues({ onNext, onSkip, onBack }: { onNext: () => void, onSkip: () => void, onBack: () => void }) {
  const [selected, setSelected] = useState<string[]>(['Family pressure']);
  
  const issues = ['Exams', 'Grades', 'Family pressure', 'Comparison', 'Social media', 'Focus', 'Sleep', 'Loneliness', 'Future'];

  const toggle = (issue: string) => {
    if (selected.includes(issue)) {
      setSelected(selected.filter(i => i !== issue));
    } else {
      setSelected([...selected, issue]);
    }
  };

  return (
    <div className="flex-1 flex flex-col bg-background">
      <header className="bg-background/85 backdrop-blur-xl sticky top-0 z-50 flex items-center justify-between px-6 py-4 w-full">
        <button onClick={onBack} className="text-primary hover:bg-primary-light p-2 rounded-full transition-colors">
          <ArrowLeft className="w-6 h-6" />
        </button>
        <div className="flex gap-2">
          <div className="w-2 h-2 rounded-full bg-neutral/20"></div>
          <div className="w-6 h-2 rounded-full bg-primary"></div>
          <div className="w-2 h-2 rounded-full bg-neutral/20"></div>
        </div>
        <button onClick={onSkip} className="font-label text-[12px] uppercase tracking-wider font-semibold text-primary px-3 py-1 rounded-lg">
          Skip
        </button>
      </header>

      <main className="flex-1 px-6 pt-8 pb-32 flex flex-col items-center overflow-y-auto">
        <div className="w-full flex flex-col items-center justify-center gap-1 mb-10">
          <div className="w-32 h-4 rounded-full bg-[#FBF0EB]"></div>
          <div className="w-40 h-4 rounded-full bg-[#F7E5DE]"></div>
          <div className="w-48 h-4 rounded-full bg-[#F2D7CD]"></div>
          <div className="w-56 h-4 rounded-full bg-[#EBC9BE]"></div>
          <div className="w-64 h-4 rounded-full bg-[#F2C4B0]"></div>
          <div className="mt-6">
            <div className="relative w-24 h-24 rounded-2xl overflow-hidden shadow-sm">
              <img alt="Texture" className="w-full h-full object-cover grayscale opacity-30 mix-blend-multiply" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCJyPkZBTbhCPJR0CTLJYY5rc6X2qyqKJPEdvnOHkQULnmw1fqTFZv9btmjbjzI4MhDweP8lEOus2fBgstUpv5xIbFRPbUMoNlbwKaRnkNXM_N7MPbSkRp9qN--opFilOlaL9-EI0Z3yBhHngTCHIXlnjvtEUjY8TUgqbafW0RTOOm-U2p-0lMTUx_-GKmzGPPe9mhyddgBa06sXFzt6ZMkBeXHSVCoA-alJRMA1Rcu0YwxEKfK9PL0ZYWTPMwPTsb7vxQRSDazNU-j" />
            </div>
          </div>
        </div>

        <div className="text-center mb-10 w-full">
          <h1 className="font-headline font-bold text-[28px] leading-tight text-[#2A1F1A] mb-3">
            What is weighing on you lately?
          </h1>
          <p className="text-[14px] text-neutral font-medium">
            Choose as many as feel true.
          </p>
        </div>

        <div className="grid grid-cols-3 gap-3 w-full">
          {issues.map(issue => {
            const isSelected = selected.includes(issue);
            return (
              <button 
                key={issue}
                onClick={() => toggle(issue)}
                className={`py-4 px-2 rounded-2xl text-[14px] font-medium transition-all duration-200 active:scale-95 flex items-center justify-center text-center ${
                  isSelected 
                    ? 'bg-primary-light border border-primary text-primary-dark font-bold shadow-sm' 
                    : 'bg-surface border border-neutral/10 text-neutral hover:bg-neutral/5'
                }`}
              >
                {issue}
              </button>
            );
          })}
        </div>

        <div className="mt-12 text-center opacity-40 select-none">
          <span className="urdu-text text-[20px] text-primary-dark">سکونِ دل کے لیے تھوڑا سا وقت نکالیں</span>
        </div>
      </main>

      <footer className="absolute bottom-0 left-0 w-full px-6 pb-8 pt-4 bg-background/90 backdrop-blur-md">
        <button onClick={onNext} className="w-full h-14 bg-gradient-to-r from-primary to-primary-dark text-white font-label text-[14px] uppercase tracking-widest font-bold rounded-2xl shadow-lg active:scale-[0.98] transition-transform flex items-center justify-center gap-2">
          Continue
          <ArrowRight className="w-5 h-5" />
        </button>
      </footer>
    </div>
  );
}

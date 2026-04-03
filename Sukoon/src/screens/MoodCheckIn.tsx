import { ArrowLeft, X } from 'lucide-react';
import { useState } from 'react';
import { Screen } from '../App';

export default function MoodCheckIn({ onNavigate }: { onNavigate: (s: Screen) => void }) {
  const [mood, setMood] = useState('Good');
  const [selectedTags, setSelectedTags] = useState<string[]>(['Calm', 'Hopeful']);

  const groupedTags = [
    {
      category: 'Feelings',
      items: [
        { en: 'Calm', ur: 'پرسکون' },
        { en: 'Hopeful', ur: 'پرامید' },
        { en: 'Motivated', ur: 'پرجوش' },
        { en: 'Okay', ur: 'ٹھیک' },
        { en: 'Sad', ur: 'اداس' },
        { en: 'Angry', ur: 'غصہ' },
      ]
    },
    {
      category: 'Mental State',
      items: [
        { en: 'Stressed', ur: 'پریشان' },
        { en: 'Anxious', ur: 'بے چین' },
        { en: 'Overwhelmed', ur: 'مغلوب' },
        { en: 'Confused', ur: 'الجھن' },
        { en: 'Lonely', ur: 'اکیلا' },
      ]
    },
    {
      category: 'Physical',
      items: [
        { en: 'Tired', ur: 'تھکا ہوا' },
        { en: 'Energetic', ur: 'توانا' },
        { en: 'Relaxed', ur: 'آرام دہ' },
      ]
    }
  ];

  const toggleTag = (tag: string) => {
    if (selectedTags.includes(tag)) {
      setSelectedTags(selectedTags.filter(t => t !== tag));
    } else if (selectedTags.length < 5) {
      setSelectedTags([...selectedTags, tag]);
    }
  };

  return (
    <div className="flex-1 flex flex-col bg-background pb-32 overflow-y-auto">
      <header className="sticky top-0 w-full bg-background/80 backdrop-blur-md flex items-center px-4 h-16 border-b border-primary/10 z-50">
        <div className="flex items-center gap-4">
          <button onClick={() => onNavigate('home')} className="w-10 h-10 flex items-center justify-center rounded-full hover:bg-primary/10 transition-colors">
            <ArrowLeft className="text-primary-dark w-6 h-6" />
          </button>
          <h1 className="text-xl font-bold text-primary-dark font-headline">Sukoon</h1>
        </div>
      </header>

      <main className="pt-8 px-6">
        <section className="text-center mb-10">
          <h2 className="text-3xl font-semibold text-[#2A1F1A] mb-8">How are you feeling?</h2>
          <div className="flex items-end justify-between px-2 h-24">
            {/* Very Bad */}
            <div className="flex flex-col items-center gap-2" onClick={() => setMood('Very Bad')}>
              <div className={`w-[52px] h-[52px] rounded-full bg-error flex flex-col items-center justify-center gap-1.5 transition-all ${mood === 'Very Bad' ? 'scale-110 opacity-100 shadow-lg' : 'opacity-60'}`}>
                <div className="flex gap-2">
                  <div className="w-1.5 h-1.5 rounded-full bg-white"></div>
                  <div className="w-1.5 h-1.5 rounded-full bg-white"></div>
                </div>
                <div className="w-4 h-0.5 bg-white rounded-full"></div>
              </div>
            </div>
            {/* Bad */}
            <div className="flex flex-col items-center gap-2" onClick={() => setMood('Bad')}>
              <div className={`w-[52px] h-[52px] rounded-full bg-[#D67B5F] flex flex-col items-center justify-center gap-1 transition-all ${mood === 'Bad' ? 'scale-110 opacity-100 shadow-lg' : 'opacity-60'}`}>
                <div className="flex gap-2 mb-1">
                  <div className="w-1.5 h-1.5 rounded-full bg-white"></div>
                  <div className="w-1.5 h-1.5 rounded-full bg-white"></div>
                </div>
                <div className="w-4 h-1 border-t-2 border-white rounded-[50%]"></div>
              </div>
            </div>
            {/* Okay */}
            <div className="flex flex-col items-center gap-2" onClick={() => setMood('Okay')}>
              <div className={`w-[52px] h-[52px] rounded-full bg-tertiary flex flex-col items-center justify-center gap-1 transition-all ${mood === 'Okay' ? 'scale-110 opacity-100 shadow-lg' : 'opacity-60'}`}>
                <div className="flex gap-2">
                  <div className="w-1.5 h-1.5 rounded-full bg-white"></div>
                  <div className="w-1.5 h-1.5 rounded-full bg-white"></div>
                </div>
                <div className="w-4 h-0.5 bg-white rounded-full"></div>
              </div>
            </div>
            {/* Good */}
            <div className="flex flex-col items-center gap-2" onClick={() => setMood('Good')}>
              <div className={`w-[80px] h-[80px] rounded-full bg-secondary flex flex-col items-center justify-center gap-2 transition-all ${mood === 'Good' ? 'scale-100 opacity-100 shadow-lg shadow-secondary/30' : 'scale-75 opacity-60'}`}>
                <div className="flex gap-3">
                  <div className="w-2.5 h-2.5 rounded-full bg-white"></div>
                  <div className="w-2.5 h-2.5 rounded-full bg-white"></div>
                </div>
                <div className="w-8 h-4 border-b-4 border-white rounded-[50%]"></div>
              </div>
              {mood === 'Good' && <span className="text-secondary font-semibold text-sm">Good</span>}
            </div>
            {/* Great */}
            <div className="flex flex-col items-center gap-2" onClick={() => setMood('Great')}>
              <div className={`w-[52px] h-[52px] rounded-full bg-[#44664B] flex flex-col items-center justify-center gap-1 transition-all ${mood === 'Great' ? 'scale-110 opacity-100 shadow-lg' : 'opacity-60'}`}>
                <div className="flex gap-2">
                  <div className="w-1.5 h-1.5 rounded-full bg-white"></div>
                  <div className="w-1.5 h-1.5 rounded-full bg-white"></div>
                </div>
                <div className="w-5 h-3 border-b-2 border-white rounded-[50%]"></div>
              </div>
            </div>
          </div>
        </section>

        <section className="mb-8">
          <div className="flex justify-between items-center mb-3">
            <h3 className="text-xl font-medium text-[#2A1F1A]">Selected Tags</h3>
            <div className="flex items-center gap-3">
              <span className="text-xs text-neutral/60 font-medium">{selectedTags.length}/5</span>
              {selectedTags.length > 0 && (
                <button onClick={() => setSelectedTags([])} className="text-xs text-error/80 hover:text-error font-medium transition-colors">Clear all</button>
              )}
            </div>
          </div>
          
          <div className="min-h-[56px] p-3 bg-surface border border-neutral/10 rounded-2xl flex flex-wrap gap-2 items-center shadow-inner">
            {selectedTags.length === 0 ? (
              <span className="text-sm text-neutral/40 italic px-2">Select up to 5 tags below...</span>
            ) : (
              selectedTags.map(tag => {
                let urdu = '';
                groupedTags.forEach(g => g.items.forEach(i => { if(i.en === tag) urdu = i.ur; }));
                
                return (
                  <div key={tag} className="flex items-center gap-1.5 px-3 py-1.5 bg-primary text-white rounded-full animate-in zoom-in duration-200 shadow-sm">
                    <span className="text-sm font-medium">{tag}</span>
                    <span className="urdu-text text-xs opacity-80">{urdu}</span>
                    <button onClick={() => toggleTag(tag)} className="ml-1 p-0.5 hover:bg-white/20 rounded-full transition-colors">
                      <X className="w-3 h-3" />
                    </button>
                  </div>
                );
              })
            )}
          </div>
        </section>

        <section className="mb-10">
          <h3 className="text-xl font-medium text-[#2A1F1A] mb-6">What's behind it?</h3>
          
          <div className="space-y-6">
            {groupedTags.map(group => (
              <div key={group.category}>
                <h4 className="text-xs font-bold text-neutral/40 uppercase tracking-wider mb-3 pl-1">{group.category}</h4>
                <div className="flex flex-wrap gap-2">
                  {group.items.map(tag => {
                    const isSelected = selectedTags.includes(tag.en);
                    const isDisabled = !isSelected && selectedTags.length >= 5;
                    
                    return (
                      <button 
                        key={tag.en}
                        onClick={() => toggleTag(tag.en)}
                        disabled={isDisabled}
                        className={`flex items-center gap-2 px-4 py-2 rounded-full border transition-all duration-200 ${
                          isSelected 
                            ? 'border-primary bg-primary-light ring-1 ring-primary scale-105 shadow-sm' 
                            : isDisabled
                              ? 'border-neutral/10 bg-surface/50 opacity-50 cursor-not-allowed'
                              : 'border-neutral/20 bg-surface hover:bg-background hover:border-primary/30 active:scale-95'
                        }`}
                      >
                        <span className={`text-sm font-medium ${isSelected ? 'text-primary-dark' : 'text-neutral'}`}>{tag.en}</span>
                        <span className={`urdu-text text-xs ${isSelected ? 'text-primary-dark' : 'opacity-60 text-neutral'}`}>{tag.ur}</span>
                      </button>
                    );
                  })}
                </div>
              </div>
            ))}
          </div>
        </section>

        <section className="mb-12">
          <label className="block text-xl font-medium text-[#2A1F1A] mb-4">Anything else?</label>
          <div className="relative">
            <textarea 
              className="w-full bg-surface border border-neutral/20 rounded-xl p-4 focus:ring-2 focus:ring-primary focus:border-primary outline-none resize-none transition-all placeholder:text-neutral/40" 
              rows={4} 
              maxLength={120} 
              placeholder="Write your thoughts..."
            ></textarea>
            <div className="absolute bottom-3 right-3 text-xs text-neutral/60 font-medium">
              0 / 120
            </div>
          </div>
        </section>

        <button onClick={() => onNavigate('home')} className="w-full bg-primary text-white font-bold py-4 rounded-xl shadow-lg shadow-primary/20 active:scale-95 transition-transform duration-150">
          Log my mood
        </button>
      </main>
    </div>
  );
}

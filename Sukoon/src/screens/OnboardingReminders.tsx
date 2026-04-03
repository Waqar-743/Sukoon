import { ArrowLeft, Sun, Moon, Bell } from 'lucide-react';
import { useState } from 'react';
import { motion } from 'motion/react';

export default function OnboardingReminders({ onNext, onBack }: { onNext: () => void, onBack: () => void }) {
  const [morningTime, setMorningTime] = useState('08:00');
  const [eveningTime, setEveningTime] = useState('21:00');

  // Helper to format time for display (e.g., "08:00" -> "8:00 AM")
  const formatTime = (timeStr: string) => {
    if (!timeStr) return '';
    const [hours, minutes] = timeStr.split(':');
    const h = parseInt(hours, 10);
    const ampm = h >= 12 ? 'PM' : 'AM';
    const formattedHours = h % 12 || 12;
    return `${formattedHours}:${minutes} ${ampm}`;
  };

  return (
    <div className="flex-1 flex flex-col bg-surface overflow-hidden">
      <nav className="flex items-center justify-between px-6 py-5 z-50 relative">
        <button onClick={onBack} className="w-10 h-10 flex items-center justify-center rounded-full hover:bg-neutral/10 transition-colors">
          <ArrowLeft className="w-6 h-6 text-[#2A1F1A]" />
        </button>
        <div className="flex items-center gap-2">
          <div className="w-1.5 h-1.5 rounded-full bg-neutral/20"></div>
          <div className="w-1.5 h-1.5 rounded-full bg-neutral/20"></div>
          <div className="w-6 h-1.5 rounded-full bg-primary"></div>
        </div>
        <div className="w-10"></div>
      </nav>

      <main className="flex-1 flex flex-col px-6 pt-2 pb-10 relative z-20">
        <motion.div 
          initial={{ y: 20, opacity: 0 }}
          animate={{ y: 0, opacity: 1 }}
          transition={{ duration: 0.5 }}
          className="mb-10 text-center"
        >
          <div className="w-16 h-16 bg-primary-light rounded-2xl flex items-center justify-center mx-auto mb-6 shadow-inner">
            <Bell className="w-8 h-8 text-primary-dark" />
          </div>
          <h1 className="text-[28px] font-headline font-bold text-[#2A1F1A] leading-tight mb-3">
            Let us check in with you daily.
          </h1>
          <p className="text-[15px] text-neutral/80">
            Set two gentle reminders to pause, reflect, and log your mood.
          </p>
        </motion.div>

        <div className="space-y-4 flex-1">
          {/* Morning Reminder */}
          <motion.div 
            initial={{ x: -20, opacity: 0 }}
            animate={{ x: 0, opacity: 1 }}
            transition={{ duration: 0.5, delay: 0.2 }}
            className="bg-white p-5 rounded-2xl border border-neutral/10 shadow-sm flex items-center justify-between group hover:border-primary/30 transition-colors"
          >
            <div className="flex items-center gap-4">
              <div className="w-12 h-12 rounded-full bg-[#FFF4E5] flex items-center justify-center">
                <Sun className="w-6 h-6 text-[#F59E0B]" />
              </div>
              <div>
                <h3 className="font-bold text-[#2A1F1A]">Morning</h3>
                <p className="text-xs text-neutral/60">Start your day right</p>
              </div>
            </div>
            <div className="relative">
              <input 
                type="time" 
                value={morningTime}
                onChange={(e) => setMorningTime(e.target.value)}
                className="absolute inset-0 w-full h-full opacity-0 cursor-pointer z-10"
              />
              <div className="bg-background px-4 py-2 rounded-xl font-bold text-primary border border-primary/20 group-hover:bg-primary-light transition-colors relative z-0">
                {formatTime(morningTime)}
              </div>
            </div>
          </motion.div>

          {/* Evening Reminder */}
          <motion.div 
            initial={{ x: -20, opacity: 0 }}
            animate={{ x: 0, opacity: 1 }}
            transition={{ duration: 0.5, delay: 0.3 }}
            className="bg-white p-5 rounded-2xl border border-neutral/10 shadow-sm flex items-center justify-between group hover:border-primary/30 transition-colors"
          >
            <div className="flex items-center gap-4">
              <div className="w-12 h-12 rounded-full bg-[#F3F4F6] flex items-center justify-center">
                <Moon className="w-6 h-6 text-[#4B5563]" />
              </div>
              <div>
                <h3 className="font-bold text-[#2A1F1A]">Evening</h3>
                <p className="text-xs text-neutral/60">Reflect on your day</p>
              </div>
            </div>
            <div className="relative">
              <input 
                type="time" 
                value={eveningTime}
                onChange={(e) => setEveningTime(e.target.value)}
                className="absolute inset-0 w-full h-full opacity-0 cursor-pointer z-10"
              />
              <div className="bg-background px-4 py-2 rounded-xl font-bold text-primary border border-primary/20 group-hover:bg-primary-light transition-colors relative z-0">
                {formatTime(eveningTime)}
              </div>
            </div>
          </motion.div>
        </div>

        <motion.footer 
          initial={{ y: 20, opacity: 0 }}
          animate={{ y: 0, opacity: 1 }}
          transition={{ duration: 0.5, delay: 0.4 }}
          className="mt-auto pt-6"
        >
          <p className="text-[13px] text-neutral/60 text-center mb-6">
            We will ask for notification permission next.
          </p>
          <button 
            onClick={onNext} 
            className="w-full h-14 bg-primary rounded-2xl flex items-center justify-center gap-2 active:scale-[0.98] shadow-lg shadow-primary/25 transition-all"
          >
            <span className="text-white font-bold tracking-wide text-lg">Start your journey</span>
          </button>
        </motion.footer>
      </main>
    </div>
  );
}

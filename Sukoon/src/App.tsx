import { useState, useEffect } from 'react';
import { AnimatePresence, motion } from 'motion/react';
import Splash from './screens/Splash';
import Start from './screens/Start';
import OnboardingName from './screens/OnboardingName';
import OnboardingIssues from './screens/OnboardingIssues';
import OnboardingReminders from './screens/OnboardingReminders';
import Home from './screens/Home';
import MoodCheckIn from './screens/MoodCheckIn';
import Journal from './screens/Journal';
import Goals from './screens/Goals';
import Detox from './screens/Detox';

export type Screen = 'splash' | 'start' | 'onboarding-name' | 'onboarding-issues' | 'onboarding-reminders' | 'home' | 'mood' | 'journal' | 'goals' | 'detox';

export default function App() {
  const [currentScreen, setCurrentScreen] = useState<Screen>('splash');
  const [userName, setUserName] = useState(() => {
    return window.localStorage.getItem('sukoon_user_name') ?? '';
  });

  useEffect(() => {
    if (currentScreen === 'splash') {
      const timer = setTimeout(() => setCurrentScreen('start'), 2500);
      return () => clearTimeout(timer);
    }
  }, [currentScreen]);

  useEffect(() => {
    window.localStorage.setItem('sukoon_user_name', userName);
  }, [userName]);

  const renderScreen = () => {
    if (currentScreen === 'splash') return <Splash />;
    if (currentScreen === 'start') {
      return <Start onNext={() => setCurrentScreen('onboarding-name')} />;
    }
    if (currentScreen === 'onboarding-name') {
      return (
        <OnboardingName
          onNext={(name) => {
            setUserName(name);
            setCurrentScreen('onboarding-issues');
          }}
          onSkip={() => setCurrentScreen('home')}
          initialName={userName}
        />
      );
    }
    if (currentScreen === 'onboarding-issues') {
      return (
        <OnboardingIssues
          onNext={() => setCurrentScreen('onboarding-reminders')}
          onSkip={() => setCurrentScreen('home')}
          onBack={() => setCurrentScreen('onboarding-name')}
        />
      );
    }
    if (currentScreen === 'onboarding-reminders') {
      return (
        <OnboardingReminders
          onNext={() => setCurrentScreen('home')}
          onBack={() => setCurrentScreen('onboarding-issues')}
        />
      );
    }
    if (currentScreen === 'home') {
      return <Home onNavigate={setCurrentScreen} userName={userName} />;
    }
    if (currentScreen === 'mood') return <MoodCheckIn onNavigate={setCurrentScreen} />;
    if (currentScreen === 'journal') return <Journal onNavigate={setCurrentScreen} />;
    if (currentScreen === 'goals') {
      return <Goals onNavigate={setCurrentScreen} userName={userName} />;
    }
    return <Detox onNavigate={setCurrentScreen} />;
  };

  return (
    <div className="min-h-screen relative overflow-hidden">
      <div className="pointer-events-none absolute inset-0">
        <div className="absolute -top-28 -right-32 h-72 w-72 rounded-full bg-primary/18 blur-3xl" />
        <div className="absolute -bottom-36 -left-36 h-80 w-80 rounded-full bg-secondary/15 blur-3xl" />
      </div>

      <div className="mx-auto max-w-md min-h-screen px-2 py-3 sm:px-4 sm:py-4">
        <div className="glass-surface relative h-[calc(100vh-1.5rem)] sm:h-[calc(100vh-2rem)] rounded-[2rem] overflow-hidden shadow-[0_28px_70px_rgba(42,31,26,0.16)] border border-white/65 flex flex-col min-h-0">
          <div className="flex-1 min-h-0">
            <AnimatePresence mode="wait">
              <motion.div
                key={currentScreen}
                initial={{ opacity: 0, y: 14, scale: 0.985 }}
                animate={{ opacity: 1, y: 0, scale: 1 }}
                exit={{ opacity: 0, y: -10, scale: 0.992 }}
                transition={{ duration: 0.32, ease: [0.22, 1, 0.36, 1] }}
                className="h-full flex-1 min-h-0 flex flex-col"
              >
                {renderScreen()}
              </motion.div>
            </AnimatePresence>
          </div>
        </div>
      </div>
    </div>
  );
}

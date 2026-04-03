import { useState, useEffect } from 'react';
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

  useEffect(() => {
    if (currentScreen === 'splash') {
      const timer = setTimeout(() => setCurrentScreen('start'), 2500);
      return () => clearTimeout(timer);
    }
  }, [currentScreen]);

  return (
    <div className="min-h-screen bg-background max-w-md mx-auto relative shadow-2xl overflow-hidden flex flex-col">
      {currentScreen === 'splash' && <Splash />}
      {currentScreen === 'start' && <Start onNext={() => setCurrentScreen('onboarding-name')} />}
      {currentScreen === 'onboarding-name' && <OnboardingName onNext={() => setCurrentScreen('onboarding-issues')} onSkip={() => setCurrentScreen('home')} />}
      {currentScreen === 'onboarding-issues' && <OnboardingIssues onNext={() => setCurrentScreen('onboarding-reminders')} onSkip={() => setCurrentScreen('home')} onBack={() => setCurrentScreen('onboarding-name')} />}
      {currentScreen === 'onboarding-reminders' && <OnboardingReminders onNext={() => setCurrentScreen('home')} onBack={() => setCurrentScreen('onboarding-issues')} />}
      
      {currentScreen === 'home' && <Home onNavigate={setCurrentScreen} />}
      {currentScreen === 'mood' && <MoodCheckIn onNavigate={setCurrentScreen} />}
      {currentScreen === 'journal' && <Journal onNavigate={setCurrentScreen} />}
      {currentScreen === 'goals' && <Goals onNavigate={setCurrentScreen} />}
      {currentScreen === 'detox' && <Detox onNavigate={setCurrentScreen} />}
    </div>
  );
}

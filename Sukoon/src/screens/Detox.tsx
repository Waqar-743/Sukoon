import { Settings, TimerOff, BarChart2, ArrowDown, ArrowUp, Lightbulb, Leaf, Award, Flame, TrendingDown, Timer, Book, Sun, Lock, Save, Plus, CheckCircle2 } from 'lucide-react';
import { useEffect, useMemo, useState } from 'react';
import BottomNav from '../components/BottomNav';
import { Screen } from '../App';

type DetoxDayLog = {
  date: string;
  totalMinutes: number;
  socialMinutes: number;
  mood: number;
};

type DetoxSession = {
  id: string;
  title: string;
  durationMinutes: number;
  points: number;
  completedAt: string;
};

const DETOX_DAILY_LOGS_KEY = 'sukoon_detox_daily_logs_v1';
const DETOX_SESSIONS_KEY = 'sukoon_detox_sessions_v1';

const toDayKey = (date = new Date()) => {
  const year = date.getFullYear();
  const month = `${date.getMonth() + 1}`.padStart(2, '0');
  const day = `${date.getDate()}`.padStart(2, '0');
  return `${year}-${month}-${day}`;
};

const dayKeyAtOffset = (offset: number, reference = new Date()) => {
  const date = new Date(reference);
  date.setHours(0, 0, 0, 0);
  date.setDate(date.getDate() - offset);
  return toDayKey(date);
};

const clamp = (value: number, min: number, max: number) => {
  return Math.min(Math.max(value, min), max);
};

const average = (values: number[]) => {
  if (values.length === 0) return 0;
  return Math.round(values.reduce((sum, value) => sum + value, 0) / values.length);
};

const formatMinutes = (minutes: number) => {
  const safeMinutes = Math.max(0, Math.round(minutes));
  const hours = Math.floor(safeMinutes / 60);
  const remainingMinutes = safeMinutes % 60;

  if (hours === 0) return `${remainingMinutes}m`;
  if (remainingMinutes === 0) return `${hours}h`;
  return `${hours}h ${remainingMinutes}m`;
};

const formatWeeklyDelta = (minutes: number) => {
  const sign = minutes > 0 ? '+' : '';
  return `${sign}${(minutes / 60).toFixed(1)}h`;
};

const normalizeDailyLog = (raw: unknown): DetoxDayLog | null => {
  if (!raw || typeof raw !== 'object') return null;

  const candidate = raw as {
    date?: unknown;
    totalMinutes?: unknown;
    socialMinutes?: unknown;
    mood?: unknown;
  };

  if (typeof candidate.date !== 'string' || !/^\d{4}-\d{2}-\d{2}$/.test(candidate.date)) {
    return null;
  }

  const totalMinutes = clamp(Number(candidate.totalMinutes) || 0, 0, 24 * 60);
  const socialMinutes = clamp(Number(candidate.socialMinutes) || 0, 0, totalMinutes);
  const mood = clamp(Number(candidate.mood) || 3, 1, 5);

  return {
    date: candidate.date,
    totalMinutes,
    socialMinutes,
    mood,
  };
};

const normalizeSession = (raw: unknown): DetoxSession | null => {
  if (!raw || typeof raw !== 'object') return null;

  const candidate = raw as {
    id?: unknown;
    title?: unknown;
    durationMinutes?: unknown;
    points?: unknown;
    completedAt?: unknown;
  };

  if (typeof candidate.title !== 'string' || !candidate.title.trim()) {
    return null;
  }

  return {
    id: typeof candidate.id === 'string' ? candidate.id : `${Date.now()}-${Math.random().toString(36).slice(2, 8)}`,
    title: candidate.title.trim(),
    durationMinutes: clamp(Number(candidate.durationMinutes) || 0, 1, 24 * 60),
    points: clamp(Number(candidate.points) || 0, 1, 10000),
    completedAt: typeof candidate.completedAt === 'string' ? candidate.completedAt : new Date().toISOString(),
  };
};

const loadDailyLogs = (): DetoxDayLog[] => {
  try {
    const raw = window.localStorage.getItem(DETOX_DAILY_LOGS_KEY);
    if (!raw) return [];
    const parsed = JSON.parse(raw);
    if (!Array.isArray(parsed)) return [];
    return parsed
      .map(normalizeDailyLog)
      .filter((log): log is DetoxDayLog => log !== null)
      .sort((a, b) => a.date.localeCompare(b.date));
  } catch {
    return [];
  }
};

const loadSessions = (): DetoxSession[] => {
  try {
    const raw = window.localStorage.getItem(DETOX_SESSIONS_KEY);
    if (!raw) return [];
    const parsed = JSON.parse(raw);
    if (!Array.isArray(parsed)) return [];
    return parsed
      .map(normalizeSession)
      .filter((session): session is DetoxSession => session !== null)
      .sort((a, b) => new Date(b.completedAt).getTime() - new Date(a.completedAt).getTime());
  } catch {
    return [];
  }
};

const calculateFocusStreak = (sessions: DetoxSession[]) => {
  const sessionDaySet = new Set(sessions.map(session => toDayKey(new Date(session.completedAt))));
  let streak = 0;
  for (let offset = 0; ; offset += 1) {
    if (!sessionDaySet.has(dayKeyAtOffset(offset))) {
      break;
    }
    streak += 1;
  }
  return streak;
};

export default function Detox({ onNavigate }: { onNavigate: (s: Screen) => void }) {
  const [dailyLogs, setDailyLogs] = useState<DetoxDayLog[]>(() => loadDailyLogs());
  const [sessions, setSessions] = useState<DetoxSession[]>(() => loadSessions());
  const [toastMessage, setToastMessage] = useState<string | null>(null);

  const [todayTotalInput, setTodayTotalInput] = useState('0');
  const [todaySocialInput, setTodaySocialInput] = useState('0');
  const [todayMoodInput, setTodayMoodInput] = useState('3');

  const [customTitle, setCustomTitle] = useState('');
  const [customDuration, setCustomDuration] = useState('45');
  const [customPoints, setCustomPoints] = useState('');

  const todayKey = toDayKey();

  useEffect(() => {
    window.localStorage.setItem(DETOX_DAILY_LOGS_KEY, JSON.stringify(dailyLogs));
  }, [dailyLogs]);

  useEffect(() => {
    window.localStorage.setItem(DETOX_SESSIONS_KEY, JSON.stringify(sessions));
  }, [sessions]);

  const todayLog = useMemo(() => {
    return dailyLogs.find(log => log.date === todayKey) ?? {
      date: todayKey,
      totalMinutes: 0,
      socialMinutes: 0,
      mood: 3,
    };
  }, [dailyLogs, todayKey]);

  useEffect(() => {
    setTodayTotalInput(String(todayLog.totalMinutes));
    setTodaySocialInput(String(todayLog.socialMinutes));
    setTodayMoodInput(String(todayLog.mood));
  }, [todayLog.date, todayLog.totalMinutes, todayLog.socialMinutes, todayLog.mood]);

  const showToast = (message: string) => {
    setToastMessage(message);
    window.setTimeout(() => {
      setToastMessage(null);
    }, 2500);
  };

  const saveTodayDetails = () => {
    const totalMinutes = clamp(Number(todayTotalInput) || 0, 0, 24 * 60);
    const socialMinutes = clamp(Number(todaySocialInput) || 0, 0, totalMinutes);
    const mood = clamp(Number(todayMoodInput) || 3, 1, 5);

    setDailyLogs(previous => {
      const next = [
        ...previous.filter(log => log.date !== todayKey),
        {
          date: todayKey,
          totalMinutes,
          socialMinutes,
          mood,
        },
      ];
      return next.sort((a, b) => a.date.localeCompare(b.date));
    });

    showToast('Today\'s detox details were saved.');
  };

  const logSession = (title: string, durationMinutes: number, points: number) => {
    const safeDuration = clamp(Math.round(durationMinutes), 1, 24 * 60);
    const safePoints = clamp(Math.round(points), 1, 10000);

    setSessions(previous => {
      const next: DetoxSession[] = [
        {
          id: `${Date.now()}-${Math.random().toString(36).slice(2, 8)}`,
          title,
          durationMinutes: safeDuration,
          points: safePoints,
          completedAt: new Date().toISOString(),
        },
        ...previous,
      ];
      return next.slice(0, 500);
    });

    showToast(`${title} logged (+${safePoints} pts).`);
  };

  const saveCustomSession = () => {
    if (!customTitle.trim()) return;
    const durationMinutes = clamp(Number(customDuration) || 0, 1, 12 * 60);
    const points = customPoints.trim()
      ? clamp(Number(customPoints) || 0, 1, 10000)
      : durationMinutes;

    logSession(customTitle.trim(), durationMinutes, points);
    setCustomTitle('');
    setCustomDuration('45');
    setCustomPoints('');
  };

  const dailyLogMap = useMemo(() => {
    return new Map(dailyLogs.map(log => [log.date, log]));
  }, [dailyLogs]);

  const totalToday = todayLog.totalMinutes;
  const socialToday = todayLog.socialMinutes;

  const previousWeekValues = useMemo(() => {
    const values: number[] = [];
    for (let offset = 1; offset <= 7; offset += 1) {
      const log = dailyLogMap.get(dayKeyAtOffset(offset));
      if (log) values.push(log.totalMinutes);
    }
    return values;
  }, [dailyLogMap]);

  const previousWeekAverage = previousWeekValues.length > 0
    ? average(previousWeekValues)
    : totalToday;

  const usageDeltaPercent = previousWeekAverage > 0
    ? Math.round(((totalToday - previousWeekAverage) / previousWeekAverage) * 100)
    : 0;

  const recentWeekValues = useMemo(() => {
    const values: number[] = [];
    for (let offset = 0; offset < 7; offset += 1) {
      const log = dailyLogMap.get(dayKeyAtOffset(offset));
      if (log) values.push(log.totalMinutes);
    }
    return values;
  }, [dailyLogMap]);

  const priorWeekValues = useMemo(() => {
    const values: number[] = [];
    for (let offset = 7; offset < 14; offset += 1) {
      const log = dailyLogMap.get(dayKeyAtOffset(offset));
      if (log) values.push(log.totalMinutes);
    }
    return values;
  }, [dailyLogMap]);

  const recentWeekAverage = recentWeekValues.length > 0 ? average(recentWeekValues) : totalToday;
  const priorWeekAverage = priorWeekValues.length > 0 ? average(priorWeekValues) : recentWeekAverage;
  const weeklyDeltaMinutes = recentWeekAverage - priorWeekAverage;

  const mindfulSessions = sessions.length;
  const detoxPoints = sessions.reduce((sum, session) => sum + session.points, 0);
  const focusStreak = calculateFocusStreak(sessions);

  const heavyMoodValues = dailyLogs
    .filter(log => log.totalMinutes >= 240)
    .map(log => log.mood);
  const lighterMoodValues = dailyLogs
    .filter(log => log.totalMinutes > 0 && log.totalMinutes < 240)
    .map(log => log.mood);

  const heavyMoodAverage = heavyMoodValues.length > 0
    ? (heavyMoodValues.reduce((sum, value) => sum + value, 0) / heavyMoodValues.length).toFixed(1)
    : null;
  const lighterMoodAverage = lighterMoodValues.length > 0
    ? (lighterMoodValues.reduce((sum, value) => sum + value, 0) / lighterMoodValues.length).toFixed(1)
    : null;

  const recentSessions = sessions.slice(0, 5);

  return (
    <div className="scrollable-panel flex-1 h-full min-h-0 flex flex-col bg-background pb-24">
      <header className="bg-surface text-primary font-headline border-b border-neutral/10 flex justify-between items-center px-4 h-16 w-full sticky top-0 z-40">
        <div className="flex items-center gap-3">
          <div className="w-10 h-10 rounded-full overflow-hidden bg-primary-light border border-neutral/20">
            <img src="/APP-ICON.png" alt="Profile" className="w-full h-full object-cover" />
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
                <span className="text-4xl font-bold font-headline text-[#2A1F1A]">{formatMinutes(totalToday)}</span>
                <div className={`flex items-center text-sm font-semibold ${usageDeltaPercent <= 0 ? 'text-secondary' : 'text-error'}`}>
                  {usageDeltaPercent <= 0 ? <ArrowDown className="w-4 h-4" /> : <ArrowUp className="w-4 h-4" />}
                  <span>{Math.abs(usageDeltaPercent)}%</span>
                </div>
              </div>
            </div>
            <BarChart2 className="text-neutral/30 w-6 h-6" />
          </div>
          <div className="flex items-center justify-between pt-4 border-t border-neutral/10">
            <div className="flex flex-col">
              <span className="text-xs text-neutral/70">Social Media</span>
              <span className="text-lg font-semibold text-neutral">{formatMinutes(socialToday)}</span>
            </div>
            <div className="flex flex-col text-right">
              <span className="text-xs text-neutral/70">Avg. {formatMinutes(previousWeekAverage)}</span>
              <span className={`text-sm font-medium ${usageDeltaPercent <= 0 ? 'text-secondary' : 'text-error'}`}>
                {usageDeltaPercent <= 0 ? 'Below average' : 'Above average'}
              </span>
            </div>
          </div>
        </section>

        <section className="bg-surface rounded-xl p-5 border border-neutral/10 shadow-sm space-y-4">
          <div className="flex items-start justify-between">
            <div>
              <h3 className="text-sm font-bold text-[#2A1F1A]">Track today's details</h3>
              <p className="text-xs text-neutral/70 mt-1">Add your real numbers so Detox insights update accurately.</p>
            </div>
            <Save className="w-5 h-5 text-primary/60" />
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-3 gap-3">
            <label className="flex flex-col gap-1 text-xs text-neutral/80">
              Total Screen Time (min)
              <input
                type="number"
                min={0}
                max={1440}
                value={todayTotalInput}
                onChange={(event) => setTodayTotalInput(event.target.value)}
                className="bg-background border border-neutral/20 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none"
              />
            </label>
            <label className="flex flex-col gap-1 text-xs text-neutral/80">
              Social Media (min)
              <input
                type="number"
                min={0}
                max={1440}
                value={todaySocialInput}
                onChange={(event) => setTodaySocialInput(event.target.value)}
                className="bg-background border border-neutral/20 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none"
              />
            </label>
            <label className="flex flex-col gap-1 text-xs text-neutral/80">
              Mood (1 to 5)
              <input
                type="number"
                min={1}
                max={5}
                value={todayMoodInput}
                onChange={(event) => setTodayMoodInput(event.target.value)}
                className="bg-background border border-neutral/20 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none"
              />
            </label>
          </div>

          <button
            onClick={saveTodayDetails}
            className="w-full bg-primary text-white rounded-xl py-3 font-bold text-sm active:scale-[0.99] transition-transform"
          >
            Save Today\'s Detox Details
          </button>
        </section>

        <section className="bg-primary-light border border-primary/20 rounded-xl p-5 flex items-start gap-4 shadow-sm">
          <div className="bg-surface p-2 rounded-lg text-primary shadow-inner">
            <Lightbulb className="w-5 h-5" />
          </div>
          <div>
            <p className="text-[#55433d] leading-relaxed">
              <span className="font-semibold block mb-1">Did you notice?</span>
              {heavyMoodAverage && lighterMoodAverage ? (
                <>
                  On heavy screen days, your mood averages <span className="text-primary font-bold">{heavyMoodAverage}/5</span>. On lighter screen days it improves to <span className="text-secondary font-bold">{lighterMoodAverage}/5</span>.
                </>
              ) : (
                <>
                  Add a few days of usage and mood entries to unlock real Detox insight patterns.
                </>
              )}
            </p>
            <p className="text-xs mt-2 text-primary/60 italic">Finding your flow, one moment at a time.</p>
          </div>
        </section>

        <section className="grid grid-cols-2 gap-4">
          <div className="premium-card interactive-lift rounded-xl p-4 flex flex-col items-center text-center">
            <div className="icon-box w-12 h-12 rounded-full mb-3 bg-secondary/10">
              <Leaf className="text-secondary w-6 h-6" />
            </div>
            <span className="text-2xl font-bold text-[#2A1F1A]">{mindfulSessions}</span>
            <span className="text-xs text-neutral">Mindful Sessions</span>
          </div>
          <div className="premium-card interactive-lift rounded-xl p-4 flex flex-col items-center text-center">
            <div className="icon-box w-12 h-12 rounded-full mb-3 bg-tertiary-light">
              <Award className="text-tertiary w-6 h-6" />
            </div>
            <span className="text-2xl font-bold text-[#2A1F1A]">{detoxPoints}</span>
            <span className="text-xs text-neutral">Detox Points</span>
          </div>
          <div className="premium-card interactive-lift rounded-xl p-4 flex flex-col items-center text-center">
            <div className="icon-box w-12 h-12 rounded-full mb-3 bg-primary-light">
              <Flame className="text-primary w-6 h-6" />
            </div>
            <span className="text-2xl font-bold text-[#2A1F1A]">{focusStreak} Days</span>
            <span className="text-xs text-neutral">Focus Streak</span>
          </div>
          <div className="premium-card interactive-lift rounded-xl p-4 flex flex-col items-center text-center">
            <div className="icon-box w-12 h-12 rounded-full mb-3 bg-secondary-light">
              <TrendingDown className="text-secondary w-6 h-6" />
            </div>
            <span className="text-2xl font-bold text-[#2A1F1A]">{formatWeeklyDelta(weeklyDeltaMinutes)}</span>
            <span className="text-xs text-neutral">vs. Last Week</span>
          </div>
        </section>

        <section className="space-y-4 pt-2">
          <h3 className="text-sm font-bold font-headline flex items-center gap-2 px-1">
            Start a focus session <span className="text-xs font-normal opacity-50 font-body">وقت سکون</span>
          </h3>
          
          <button onClick={() => logSession('Quick detox', 30, 30)} className="interactive-lift w-full text-left bg-secondary-light border border-secondary/30 rounded-xl p-4 flex justify-between items-center group active:scale-95 transition-transform">
            <div className="flex items-center gap-4">
              <div className="icon-box w-11 h-11 rounded-lg bg-surface">
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

          <button onClick={() => logSession('Study zone', 90, 100)} className="interactive-lift w-full text-left bg-primary-light border border-primary/30 rounded-xl p-4 flex justify-between items-center group active:scale-95 transition-transform relative overflow-hidden">
            <div className="flex items-center gap-4">
              <div className="icon-box w-11 h-11 rounded-lg bg-surface">
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

          <button onClick={() => logSession('Social-free morning', 180, 150)} className="interactive-lift w-full text-left bg-tertiary-light border border-tertiary/30 rounded-xl p-4 flex justify-between items-center group active:scale-95 transition-transform">
            <div className="flex items-center gap-4">
              <div className="icon-box w-11 h-11 rounded-lg bg-surface">
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

          <button onClick={() => logSession('Social-free day', 24 * 60, 400)} className="interactive-lift w-full text-left bg-error-light border border-error/50 rounded-xl p-4 flex justify-between items-center group active:scale-95 transition-transform">
            <div className="flex items-center gap-4">
              <div className="icon-box w-11 h-11 rounded-lg bg-surface">
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

        <section className="bg-surface rounded-xl p-5 border border-neutral/10 shadow-sm space-y-4">
          <div className="flex items-center justify-between">
            <h3 className="text-sm font-bold text-[#2A1F1A]">Add custom session</h3>
            <Plus className="w-4 h-4 text-primary/70" />
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-3 gap-3">
            <label className="flex flex-col gap-1 text-xs text-neutral/80 sm:col-span-3">
              Session title
              <input
                type="text"
                value={customTitle}
                onChange={(event) => setCustomTitle(event.target.value)}
                placeholder="e.g. Deep work"
                className="bg-background border border-neutral/20 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none"
              />
            </label>
            <label className="flex flex-col gap-1 text-xs text-neutral/80">
              Duration (min)
              <input
                type="number"
                min={1}
                max={720}
                value={customDuration}
                onChange={(event) => setCustomDuration(event.target.value)}
                className="bg-background border border-neutral/20 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none"
              />
            </label>
            <label className="flex flex-col gap-1 text-xs text-neutral/80">
              Points (optional)
              <input
                type="number"
                min={1}
                max={10000}
                value={customPoints}
                onChange={(event) => setCustomPoints(event.target.value)}
                placeholder="Auto = duration"
                className="bg-background border border-neutral/20 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none"
              />
            </label>
            <button
              onClick={saveCustomSession}
              disabled={!customTitle.trim()}
              className="sm:self-end bg-primary text-white rounded-lg px-4 py-2.5 text-sm font-bold disabled:opacity-50"
            >
              Log session
            </button>
          </div>
        </section>

        <section className="bg-surface rounded-xl p-5 border border-neutral/10 shadow-sm space-y-3">
          <h3 className="text-sm font-bold text-[#2A1F1A]">Recent tracked sessions</h3>
          {recentSessions.length === 0 ? (
            <p className="text-sm text-neutral/60 italic">No sessions logged yet. Complete one to start tracking progress.</p>
          ) : (
            recentSessions.map(session => (
              <div key={session.id} className="flex items-center justify-between py-2 border-b last:border-b-0 border-neutral/10">
                <div>
                  <p className="text-sm font-semibold text-[#2A1F1A]">{session.title}</p>
                  <p className="text-xs text-neutral/60">
                    {new Date(session.completedAt).toLocaleString()}
                  </p>
                </div>
                <div className="text-right">
                  <p className="text-xs text-neutral/70">{formatMinutes(session.durationMinutes)}</p>
                  <p className="text-xs font-bold text-secondary">+{session.points} pts</p>
                </div>
              </div>
            ))
          )}
        </section>
      </main>

      {toastMessage && (
        <div className="fixed top-20 left-1/2 -translate-x-1/2 z-50 animate-in slide-in-from-top-4 fade-in duration-300">
          <div className="bg-[#2A1F1A] text-white px-5 py-3 rounded-full shadow-xl flex items-center gap-2">
            <CheckCircle2 className="w-4 h-4 text-secondary-light" />
            <span className="text-sm font-medium">{toastMessage}</span>
          </div>
        </div>
      )}

      <BottomNav currentScreen="detox" onNavigate={onNavigate} />
    </div>
  );
}

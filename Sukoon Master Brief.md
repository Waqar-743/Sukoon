# Sukoon Master Brief

## Document Status
- Version: 1.0
- Date: 2026-04-02
- Purpose: Single canonical product brief for Sukoon
- Primary audience: product agents, designers, developers, and future implementation assistants
- Rule: If older documents conflict with this file, this file wins

## Source Consolidation
This brief consolidates and restructures:
- `App Features.docx`
- `Sukoon App.docx`
- `App Overview.docx`

`Sukoon App.docx` is the main source for philosophy, psychology, and guardrails.  
`App Features.docx` is the main source for full-app feature requirements.  
`App Overview.docx` should no longer be treated as the app overview; its useful parts belong in user-facing content appendices.

---

## 1. Product Summary
Sukoon is an offline-first, privacy-respecting Flutter app for Pakistani students aged 14–24. It helps users manage mood, anxiety, journaling, habits, focus, and unhealthy social media use without using the same addictive design patterns it is trying to reduce.

Sukoon is:
- a daily emotional support companion
- a self-awareness and behavior-change tool
- culturally grounded for Pakistani student life
- bilingual by design where key copy matters

Sukoon is not:
- a clinical diagnosis tool
- a therapy substitute
- a public social network
- a cloud backup app for sensitive personal data

---

## 2. Product Vision
Build a calm, trustworthy app that helps students understand their emotional patterns, regulate themselves in difficult moments, and replace reflexive scrolling with more intentional living.

The product should feel like:
- a trusted older friend
- psychologically informed, but not clinical
- warm, direct, and non-shaming
- useful even with no internet

The product should never feel like:
- a manipulative productivity app
- a social ranking system
- a guilt machine
- Instagram with softer colors

---

## 3. Target Users

### Primary User Segments
1. School students (Matric / FSc, approx. 14–18)
2. University students (approx. 18–24)
3. Competitive exam students (MDCAT, CSS, engineering entry tests, etc.)

### User Reality in Pakistan
The app must reflect the real pressures users face:
- family comparison and cousin culture
- public exam pressure and performance identity
- guilt around rest
- social comparison amplified by social media
- loneliness even when digitally connected
- pressure to appear successful, disciplined, or happy

### Core User Needs
Users need:
- emotional check-ins without judgment
- calming tools for stress and overwhelm
- private reflection space
- help noticing patterns between mood and behavior
- support reducing compulsive scrolling
- motivation that does not depend on shame

---

## 4. Core Product Principles

### 4.1 Offline-first by default
All core features must work without internet:
- onboarding
- mood tracking
- calm tools
- journal
- goals and habits
- detox timers
- points and badges
- local insights where data is available

Internet is required only for community features and any future server-backed services.

### 4.2 Privacy by architecture
The following data must stay on device only:
- mood logs
- journal entries
- habit records
- streaks
- points
- local screen-time-derived insights

No cloud sync for sensitive personal data in V1.

### 4.3 No dark patterns
Sukoon must not copy the behavior mechanics of addictive apps. Do not use:
- infinite scroll inside Sukoon
- algorithmic content ranking for core app experiences
- variable reward notification timing
- shame-based streak recovery
- public validation metrics
- manipulative urgency copy

### 4.4 Compassion over pressure
The app must interpret relapses, missed streaks, and high-scroll days as information, not failure.

### 4.5 Cultural grounding
Copy must sound natural for Pakistani students and must not rely on generic Western wellness language.

### 4.6 Bilingual support
English is the default app language. Urdu support must exist for key:
- prompts
- affirmations
- notifications
- calming guidance

---

## 5. Success Definition

### Product Success
Sukoon succeeds if users can:
- check in with their mood regularly
- journal privately and consistently
- access calming tools quickly during distress
- notice patterns between emotional state and behavior
- reduce impulsive social media use over time
- feel supported rather than judged

### MVP Success Signals
For V1, the product is considered successful if:
- onboarding is completed smoothly
- mood logging and journaling work fully offline
- at least one calm tool is reliable and polished
- goals and detox sessions are usable without confusion
- the app clearly preserves privacy
- the app tone remains consistent across screens

---

## 6. Problem Model

### 6.1 Mental wellness problem space
Students often live under sustained pressure from exams, comparison, uncertainty, and family expectations. This creates emotional overload, low self-worth, anxiety, sleep disruption, and avoidance behavior.

### 6.2 Social media and FOMO problem space
FOMO is not just jealousy. It behaves like a threat response. Social media amplifies:
- social comparison
- notification checking
- variable reward addiction
- validation dependency
- emotional restlessness

Over time this can produce:
- reduced concentration
- sleep disruption
- anxiety
- inadequacy
- loneliness
- guilt after scrolling
- identity confusion

### 6.3 Design implication
Sukoon is not just tracking mood or time. It is helping the student:
- see what is happening
- interrupt automatic behavior
- replace unhealthy loops
- rebuild self-worth internally

---

## 7. Psychological Framework
The product is guided by three practical frameworks:

### 7.1 Habit Loop Theory
Behavior pattern:
- Cue
- Routine
- Reward

Sukoon should identify cues and interrupt routines, then offer better rewards.

### 7.2 Self-Determination Theory
Users need:
- autonomy
- competence
- relatedness

Sukoon should create real versions of these needs instead of algorithmic versions.

### 7.3 Cognitive Reframing
Students often believe distorted thoughts during comparison-heavy moments. Sukoon should gently help them question those thoughts without lecturing.

### 7.4 Seven-Layer Intervention Model
1. Awareness  
2. Measurement  
3. Interruption  
4. Replacement  
5. Detox  
6. Rebuild  
7. Sustain  

This model is especially important for the Detox/FOMO module.

---

## 8. App Experience Overview
Sukoon is a connected system, not a set of isolated features.

### Main product loop
1. User checks in emotionally
2. App reflects patterns back clearly
3. User gets calm or reflective support
4. User builds healthier routines
5. User reduces reactive scrolling and increases intentional behavior

### Core app areas
- Onboarding
- Home
- Mood
- Calm
- Journal
- Goals
- Detox
- Community
- Settings

### Bottom navigation
- Home
- Mood
- Journal
- Goals
- Detox

Community is accessed through feature entry points, not bottom nav.

---

## 9. Information Architecture and Routes

### Primary routes
- `/splash`
- `/onboarding/profile`
- `/onboarding/triggers`
- `/onboarding/notifications`
- `/home`
- `/home/emergency-kit`
- `/mood/checkin`
- `/mood/history`
- `/mood/insights`
- `/calm`
- `/calm/breathing/:type`
- `/calm/grounding`
- `/calm/affirmations`
- `/journal`
- `/journal/editor/:id?`
- `/journal/entry/:id`
- `/goals`
- `/goals/habit/edit/:id?`
- `/goals/history`
- `/detox`
- `/detox/session/:type`
- `/detox/challenge`
- `/detox/stats`
- `/community`
- `/community/compose`
- `/community/library`
- `/settings`

---

## 10. Technical and Architecture Constraints

### Required stack
- Flutter
- Riverpod with code generation
- Isar for local storage
- GoRouter for navigation
- fl_chart for charts
- Lottie + AnimationController for motion
- flutter_local_notifications for notifications
- just_audio for sound
- shared_preferences for simple preferences
- local_auth for biometric lock
- share_plus and screenshot for sharing/export
- connectivity_plus where needed

### Community-only cloud stack
- firebase_core
- firebase_auth
- cloud_firestore
- cloud_functions

### Architecture preference
Feature-first structure:
- `core/`
- `features/`
- `shared/`

Within each feature:
- `data/`
- `domain/`
- `presentation/`

### Storage rule
Use Isar for personal and behavioral data. SharedPreferences may be used only for small app settings and first-run flags.

---

## 11. Platform Scope and Limitations

### Supported platforms
- Android
- iOS

### Reality of platform support
The product should support both, but Android is the stronger platform for behavior-related insights.

### Android
Android can support richer screen-time and app-usage insights using usage access permissions.

### iOS
iOS should still support the app, but some usage analytics may need fallback behavior such as:
- manual logging
- reduced detox analytics
- limited or no app-level screen-time correlation depending on accessible APIs and policy constraints

### Product rule
Do not promise identical analytics fidelity across Android and iOS unless technically confirmed.

---

## 12. Feature Specifications

## 12.1 Onboarding
### Purpose
Collect minimal personalization data without creating an account.

### Key screens
- Splash
- Profile
- Stress triggers
- Notification preferences

### Required outputs
- first name
- education level
- stress triggers
- preferred notification times
- onboarding completion flag

### Notes
- No email
- No phone number
- No mandatory sign-up

---

## 12.2 Home Dashboard
### Purpose
Act as the daily anchor screen.

### Must contain
- personalized greeting
- today’s mood status
- streak summary
- quick actions
- culturally relevant daily tip
- weekly mood snapshot
- emergency kit trigger when needed

### Emergency kit
Should provide immediate relief with:
- breathing
- affirmation
- grounding

### Important design requirement
The home screen must reduce friction, not add cognitive load.

---

## 12.3 Mood Tracker
### Purpose
Create a simple daily emotional check-in and later show patterns.

### Required capabilities
- 1–5 mood score
- up to 3 emotion tags
- optional short note
- local storage
- history view
- insights view

### Important insight
Mood vs screen-time correlation is a high-value feature where reliable data exists.

### Caveat
If platform data is missing, the feature must degrade gracefully instead of showing broken analytics.

---

## 12.4 Calm Tools
### Purpose
Provide immediate emotional regulation support.

### Key tools
- box breathing
- 4-7-8 breathing or equivalent
- grounding
- affirmations
- body scan
- quick journaling entry point

### Product requirement
Core relief should be accessible in 1–2 taps from home.

### Content requirement
Breathing instructions and affirmations should be available in English and Urdu where relevant.

---

## 12.5 Journal
### Purpose
Offer a fully private reflection space.

### Required behaviors
- daily prompt support
- free writing
- search entries
- link mood when relevant
- autosave
- optional biometric lock

### Product rule
This is one of the highest-trust parts of the app. Privacy messaging should be explicit.

### Content requirement
Prompt bank should include categories such as:
- exam stress
- family pressure
- social media / FOMO
- self-worth
- motivation
- failure and resilience

---

## 12.6 Goals and Habits
### Purpose
Help users build repeatable real-life behaviors that replace passive scrolling.

### Required features
- create habits
- choose category
- choose frequency
- mark completion
- track streaks
- show simple progress history

### Suggested categories
- Study
- Health
- Sleep
- Mindfulness
- Social
- Digital detox

### Guardrail
Habit tracking should motivate without becoming punishing.

---

## 12.7 Detox / Social Media / FOMO Module
### Purpose
Help users understand and reduce compulsive social media use through awareness, interruption, replacement, and self-rebuilding.

### Why this module matters
This is the deepest psychological module in the product and should be treated as a flagship experience.

### Required core screens
- Detox dashboard
- Active detox session
- Multi-day challenge
- Detox analytics

### Required session types
- Quick detox
- Study zone
- Social-free morning
- Social-free day

### Required product functions
- show today’s usage status where possible
- compare against personal baseline
- offer a replacement activity
- reward completion privately
- surface reflection prompts when meaningful

### Critical therapeutic integration
When low mood and heavy screen behavior align, the app should route users toward a FOMO reframe journal experience.

### Detox system design rule
The product must encourage conscious choice, not strict digital punishment.

---

## 12.8 Anonymous Community
### Purpose
Provide genuine connection without performance pressure.

### Product principles
- anonymous by default
- no follower system
- no public ranking
- no creator vanity metrics
- chronological ordering

### Hard constraints
- short post length
- rate limiting
- moderation before broad visibility
- crisis keyword interception

### Important wording fix
If the system auto-approves content after checks, do not call that purely manual pre-moderation. Use accurate wording.

### Community safety requirement
The community must reduce comparison, not create a softer version of social media addiction.

---

## 12.9 Settings and Profile
### Purpose
Give users control over identity-light personalization, language, privacy tools, and data actions.

### Must include
- edit first name
- education level
- stress triggers
- language toggle
- notification settings
- biometric settings
- export my data
- clear all data
- badges and points view
- app version

### Privacy requirement
Destructive actions must be explicit and double-confirmed.

---

## 13. Detox Deep Dive

### 13.1 The job of the detox module
The detox module should act as a compassionate mirror. It should help users notice:
- what triggers scrolling
- how scrolling affects mood
- what they were trying to escape
- what healthier replacements feel like

### 13.2 Layer mapping
- Awareness: psychoeducation and visible patterns
- Measurement: honest usage data
- Interruption: pause before reflexive behavior
- Replacement: offline activity suggestions
- Detox: structured challenges and quiet periods
- Rebuild: self-worth through journaling and habits
- Sustain: JOMO and intentional living

### 13.3 Required content systems
- offline activity bank
- reframe prompt bank
- motivational micro-copy bank
- challenge definitions

### 13.4 Analytics principle
Analytics should create insight, not guilt.

Bad example:
- “You wasted 3 hours again.”

Good example:
- “3 hours is a lot of your attention. What would you have chosen if you had noticed earlier?”

---

## 14. Data Model Expectations
This brief does not lock every final schema, but the following data groups must exist:
- user profile
- mood entries
- journal entries
- habits
- habit completions
- detox sessions
- detox challenges
- points ledger
- badge unlocks
- affirmation favorites
- notification preferences

### Storage principle
Personal records should be timestamped and queryable for trend generation.

---

## 15. Notifications Strategy

### Intended notification types
- morning check-in
- evening reflection
- detox progress
- detox completion
- gentle follow-up
- weekly insights

### Mandatory rules
- dismissible
- non-shaming
- no guilt framing
- no manipulative urgency
- bilingual where key
- no more than necessary

### Important caution
Streak-related reminders must not become emotional pressure. Avoid language that makes the user feel punished for missing a day.

---

## 16. Content and Tone Guidelines

### Voice
- warm
- direct
- non-clinical
- psychologically informed
- culturally grounded

### Avoid
- sounding like a medical report
- sounding like a motivational quote page
- sounding judgmental
- sounding like a productivity coach

### Writing rules
- use short sentences
- avoid jargon without explanation
- write to “you,” not “users”
- keep the student’s dignity intact

### Cultural language
Appropriate references may include:
- board exams
- family comparison
- pressure to be “ahead”
- guilt around resting

---

## 17. Accessibility and UX Expectations
The original documents under-specify this area. The unified product brief should explicitly require:
- readable text sizing
- strong contrast
- simple interaction flows
- reduced overload on high-stress screens
- meaningful empty states
- clear permission-denied states
- keyboard-safe journal editing
- animation that is supportive, not distracting

---

## 18. Safety, Boundaries, and Non-Goals

### Non-clinical boundary
Sukoon is supportive, not diagnostic or emergency care.

### Crisis handling expectation
If content suggests crisis or self-harm risk:
- do not treat the community as a solution
- interrupt posting flow
- direct the user toward real support options
- provide journaling as a secondary option, not the only option

### Minor safety requirement
Because some users are under 18, community moderation and safety wording must be extra careful.

### Non-goals
Sukoon should not:
- diagnose mental illness
- compare students publicly
- maximize session length
- become a replacement addiction

---

## 19. MVP and Phase Plan

### Phase 1 / MVP
- Onboarding
- Home dashboard
- Mood check-in
- Journal home, editor, and entry view
- Goals dashboard and habit creation
- At least one breathing tool
- Detox timer with core session types
- Emergency kit

### Phase 2
- Mood history and insights
- Full calm tools suite
- Detox challenge and stats
- Goals history and badge expansion
- Community
- Full settings
- richer Android screen-time integration
- broader Urdu coverage

### Scope rule
Agents should not treat all features as equal priority. MVP polish matters more than wide unfinished scope.

---

## 20. Open Product Decisions
These items should be resolved explicitly during design and implementation:
- exact iOS behavior for screen-time and app-usage insights
- final moderation workflow for community
- crisis keyword list and escalation copy
- final export format for local data
- exact badge and points pressure limits
- whether some features should be age-sensitive

---

## 21. Recommended Use of Older Documents

### Keep as reference only
- `App Features.docx`
- `Sukoon App.docx`

### Reclassify
`App Overview.docx` should be renamed and used as:
- sample detox psychoeducation content
- in-app educational article
- appendix material for content writers

It should not remain the primary product overview.

---

## 22. Appendix A: Example User-Facing Detox Content Role
Long-form reflective writing about FOMO, JOMO, comparison, and scrolling can still be valuable inside the product, but it belongs as:
- library content
- challenge reading
- in-app reflection copy
- guided exercises

It does not belong in the main implementation brief unless clearly labeled as sample content.

---

## 23. Final Direction for Any Future Agent
If building or refining Sukoon:
1. Start with this document
2. Treat privacy, warmth, and anti-dark-pattern rules as non-negotiable
3. Prioritize MVP stability over feature sprawl
4. Handle Android and iOS honestly rather than pretending parity where it may not exist
5. Protect user dignity in every screen, prompt, and notification

The core test for every decision is:

**Does this help the student understand themselves more clearly and act more intentionally, without making them feel judged?**

If yes, it belongs in Sukoon. If no, remove or rewrite it.

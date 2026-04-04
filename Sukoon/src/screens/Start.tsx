import { ArrowRight } from 'lucide-react';
import { motion } from 'motion/react';

export default function Start({ onNext }: { onNext: () => void }) {
  return (
    <div className="flex-1 flex flex-col bg-surface overflow-hidden relative">
      {/* Background decorative elements */}
      <div className="absolute inset-0 overflow-hidden pointer-events-none">
        <div className="absolute -top-[10%] -right-[10%] w-[500px] h-[500px] rounded-full bg-primary-light/40 blur-3xl mix-blend-multiply"></div>
        <div className="absolute -bottom-[10%] -left-[10%] w-[400px] h-[400px] rounded-full bg-secondary-light/40 blur-3xl mix-blend-multiply"></div>
      </div>

      <main className="flex-1 flex flex-col items-center justify-center px-8 relative z-10">
        <motion.div 
          initial={{ scale: 0.8, opacity: 0 }}
          animate={{ scale: 1, opacity: 1 }}
          transition={{ duration: 0.8, ease: "easeOut" }}
          className="w-48 h-48 mb-12 relative"
        >
          <div className="absolute inset-0 bg-primary/20 rounded-full blur-2xl animate-pulse"></div>
          <img 
            src="/Icon.png"
            alt="Sukoon Get Started" 
            className="w-full h-full object-contain relative z-10 drop-shadow-2xl"
          />
        </motion.div>

        <div className="text-center space-y-4">
          <motion.h1 
            initial={{ y: 20, opacity: 0 }}
            animate={{ y: 0, opacity: 1 }}
            transition={{ duration: 0.6, delay: 0.2 }}
            className="text-[42px] font-bold text-[#2A1F1A] tracking-tight font-headline leading-tight"
          >
            Find your <br/>
            <span className="text-primary">inner peace</span>
          </motion.h1>
          
          <motion.p 
            initial={{ y: 20, opacity: 0 }}
            animate={{ y: 0, opacity: 1 }}
            transition={{ duration: 0.6, delay: 0.4 }}
            className="text-[16px] text-neutral/80 font-body max-w-[280px] mx-auto leading-relaxed"
          >
            A safe space for students to manage stress, track habits, and build resilience.
          </motion.p>
        </div>
      </main>

      <motion.footer 
        initial={{ y: 40, opacity: 0 }}
        animate={{ y: 0, opacity: 1 }}
        transition={{ duration: 0.6, delay: 0.6 }}
        className="p-8 relative z-10"
      >
        <button 
          onClick={onNext} 
          className="w-full h-16 bg-[#2A1F1A] rounded-2xl flex items-center justify-center gap-3 active:scale-[0.98] shadow-xl shadow-black/10 transition-all group overflow-hidden relative"
        >
          <div className="absolute inset-0 bg-primary translate-y-full group-hover:translate-y-0 transition-transform duration-300 ease-out"></div>
          <span className="text-white font-bold tracking-wide text-lg relative z-10">Get Started</span>
          <ArrowRight className="text-white w-5 h-5 relative z-10 group-hover:translate-x-1 transition-transform" />
        </button>
        
        <p className="text-center text-sm text-neutral/60 mt-6 font-medium">
          Already have an account? <button className="text-primary font-bold hover:underline">Log in</button>
        </p>
      </motion.footer>
    </div>
  );
}

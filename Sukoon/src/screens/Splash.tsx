import { motion } from 'motion/react';

export default function Splash() {
  return (
    <main className="flex-1 flex flex-col items-center justify-center relative p-8 bg-surface overflow-hidden">
      {/* Background decorative elements */}
      <motion.div 
        initial={{ scale: 0.8, opacity: 0 }}
        animate={{ scale: 1, opacity: 0.15 }}
        transition={{ duration: 1.5, ease: "easeOut" }}
        className="absolute inset-0 flex items-center justify-center pointer-events-none"
      >
        <div className="w-[250px] h-[250px] rounded-full bg-primary blur-3xl"></div>
      </motion.div>
      
      <div className="relative z-10 flex flex-col items-center text-center">
        <motion.div
          initial={{ y: 20, opacity: 0 }}
          animate={{ y: 0, opacity: 1 }}
          transition={{ duration: 0.8, delay: 0.2 }}
        >
          <h1 className="text-[56px] font-bold text-[#2A1F1A] tracking-tight font-headline">
            Sukoon
          </h1>
        </motion.div>
        
        <motion.div
          initial={{ y: 20, opacity: 0 }}
          animate={{ y: 0, opacity: 1 }}
          transition={{ duration: 0.8, delay: 0.4 }}
          className="mt-2"
        >
          <span className="font-urdu text-[42px] text-primary urdu-text" dir="rtl">
            سکون
          </span>
        </motion.div>
        
        <motion.p 
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ duration: 1, delay: 0.8 }}
          className="mt-10 text-[16px] italic text-neutral/80 font-body tracking-wide"
        >
          "Your mind deserves peace"
        </motion.p>
      </div>
    </main>
  );
}

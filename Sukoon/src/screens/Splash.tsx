import { motion } from 'motion/react';

export default function Splash() {
  return (
    <main className="flex-1 flex flex-col items-center justify-center relative p-8 bg-surface overflow-hidden">
      <div className="relative z-10 flex flex-col items-center text-center">
        <motion.div
          initial={{ y: 20, opacity: 0 }}
          animate={{ y: 0, opacity: 1 }}
          transition={{ duration: 0.8 }}
          className="w-28 h-28 mb-5"
        >
          <img
            src="/APP-ICON.png"
            alt="Sukoon Splash"
            className="w-full h-full object-contain"
          />
        </motion.div>

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

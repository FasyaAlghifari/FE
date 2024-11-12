import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
  publicDir: 'public',  // Pastikan ini ada
  build: {
    outDir: 'dist',
    assetsDir: 'assets',
    copyPublicDir: true  // Pastikan ini true
  }
})
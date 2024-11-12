import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
  preview: {
    port: process.env.PORT || 4173,
    host: true, // Mengizinkan akses dari luar
    strictPort: true // Memastikan port yang ditentukan digunakan
  },
  server: {
    port: process.env.PORT || 8000,
    host: true
  }
})
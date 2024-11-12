FROM node:18-alpine

WORKDIR /app

# Copy seluruh proyek
COPY . .

# Install dependencies dan build
RUN npm install
RUN cd Client && npm install
RUN cd Client && npm run build

# Pindah ke folder Client sebagai working directory
WORKDIR /app/Client

# Expose port yang digunakan Vite
EXPOSE 4173

# Jalankan preview langsung tanpa cd
CMD ["npm", "run", "preview", "--", "--host", "0.0.0.0", "--port", "$PORT"]
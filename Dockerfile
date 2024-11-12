FROM node:18-alpine

WORKDIR /app

COPY . .

# Install dependencies dan build
RUN npm install
RUN cd Client && npm install
RUN cd Client && npm run build

# Pindah ke folder Client
WORKDIR /app/Client

# Buat script untuk menjalankan preview
RUN echo "#!/bin/sh\necho 'Starting preview server...'\necho 'PORT: '\${PORT:-4173}\nnpm run preview -- --host 0.0.0.0 --port \${PORT:-4173}" > start.sh
RUN chmod +x start.sh

# Expose port
EXPOSE 4173

# Gunakan environment variable untuk port
ENV PORT=4173

# Jalankan script
CMD ["./start.sh"]
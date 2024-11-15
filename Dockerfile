# Gunakan image node versi 18 alpine sebagai dasar
FROM node:18-alpine

# Set Work Directory untuk Client
WORKDIR /app/Client

# Salin file yang diperlukan saja
COPY Client/package*.json ./

# Install dependencies di dalam Client
RUN npm install

# Copy semua kode Client dan build
COPY Client ./
RUN npm run build

# Pindah ke folder /app dan install http-server secara global
WORKDIR /app
RUN npm install -g http-server

# Buat entrypoint untuk jalankan server dengan mode SPA
RUN echo '#!/bin/sh\nPORT="${PORT:-3000}"\necho "Starting server on port $PORT"\nhttp-server Client/dist -p "$PORT" -a 0.0.0.0 --cors --single' > /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose port 3000 untuk akses
EXPOSE 3000

# Jalankan entrypoint yang telah dibuat
ENTRYPOINT ["/entrypoint.sh"]

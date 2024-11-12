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
RUN echo '#!/bin/sh\n\
echo "Starting preview server..."\n\
echo "Current directory: $(pwd)"\n\
echo "PORT: ${PORT:-4173}"\n\
exec npm run preview -- --host 0.0.0.0 --port ${PORT:-4173}' > start.sh

RUN chmod +x start.sh

# Expose port
EXPOSE 4173

# Set environment variable
ENV PORT=4173

# Jalankan preview
CMD ["./start.sh"]
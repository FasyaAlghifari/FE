FROM node:18-alpine

WORKDIR /app

# Copy seluruh proyek
COPY . .

# Install dependencies dan build
RUN npm install
RUN cd Client && npm install
RUN cd Client && npm run build

# Expose port yang digunakan Vite
EXPOSE 4173

# Gunakan shell form untuk CMD
CMD cd Client && npm run preview -- --host 0.0.0.0 --port $PORT
FROM node:18-alpine

WORKDIR /app

# Copy seluruh proyek
COPY . .

# Install dependencies dan build
RUN npm install
RUN cd client && npm install
RUN cd client && npm run build

# Expose port yang digunakan Vite (biasanya 4173 untuk preview)
EXPOSE 4173

# Start the application menggunakan preview mode
CMD ["npm", "start"]
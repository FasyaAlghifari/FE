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

# Start the application
CMD ["npm", "start"]
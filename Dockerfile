FROM node:18-alpine

WORKDIR /app

COPY . .

# Install dependencies dan build
RUN npm install
RUN cd Client && npm install
RUN cd Client && npm run build

# Install serve globally
RUN npm install -g serve

# Pindah ke folder dist
WORKDIR /app/Client/dist

# Expose port
EXPOSE 3000

# Jalankan serve
CMD ["serve", "-s", ".", "-l", "3000"]
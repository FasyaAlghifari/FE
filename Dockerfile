FROM node:18-alpine

WORKDIR /app

COPY . .

# Install dependencies dan build
RUN npm install
RUN cd Client && npm install
RUN cd Client && npm run build

# Install serve
RUN npm install -g serve

# Expose port
EXPOSE 8000

# Start command
CMD ["npx", "serve", "-s", "Client/dist", "-l", "8000"]
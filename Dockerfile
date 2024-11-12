FROM node:18-alpine

WORKDIR /app

COPY . .

# Install dependencies dan build
RUN npm install
RUN cd Client && npm install
RUN cd Client && npm run build

# Install http-server
RUN npm install -g http-server

# Expose port
EXPOSE 8000

# Start command
CMD ["sh", "-c", "http-server Client/dist -p $PORT --cors"]
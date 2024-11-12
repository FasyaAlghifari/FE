FROM node:18-alpine

WORKDIR /app

COPY . .

# Install dependencies dan build
RUN npm install
RUN cd Client && npm install
RUN cd Client && npm run build

# Install http-server
RUN npm install -g http-server

# Create entrypoint script
RUN echo '#!/bin/sh\nPORT="${PORT:-3000}"\necho "Starting server on port $PORT"\nhttp-server Client/dist -p "$PORT" -a 0.0.0.0 --cors' > /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose port
EXPOSE 3000

# Use entrypoint script
ENTRYPOINT ["/entrypoint.sh"]
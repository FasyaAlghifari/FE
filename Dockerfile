FROM node:18-alpine

WORKDIR /app

COPY . .

# Install dependencies dan build
RUN npm install
RUN cd Client && npm install
RUN cd Client && npm run build

# Copy folder public dan src ke dist dengan struktur yang benar
RUN cp -r Client/public/* Client/dist/
RUN mkdir -p Client/dist/src
RUN cp -r Client/src/* Client/dist/src/

# Install http-server
RUN npm install -g http-server

# Create entrypoint script
RUN echo '#!/bin/sh\nPORT="${PORT:-3000}"\necho "Starting server on port $PORT"\nhttp-server Client/dist -p "$PORT" -a 0.0.0.0 --cors' > /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 3000

ENTRYPOINT ["/entrypoint.sh"]
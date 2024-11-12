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
EXPOSE 3000

# Start command dengan host 0.0.0.0
CMD /bin/sh -c "http-server Client/dist -p ${PORT:-3000} -a 0.0.0.0 --cors"
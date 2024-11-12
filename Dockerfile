FROM node:18-alpine

WORKDIR /app

COPY . .

RUN npm install
RUN cd Client && npm install
RUN cd Client && npm run build
RUN npm install -g http-server

EXPOSE 8000

# Gunakan shell form untuk memastikan variabel environment terbaca
CMD /bin/sh -c "http-server Client/dist -p ${PORT:-8000} --cors"
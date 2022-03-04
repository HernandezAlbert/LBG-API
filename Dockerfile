FROM node:14
WORKDIR /home/albert_hernandez/LBG-API
COPY . .
RUN npm install
ENV PORT=5000
ENTRYPOINT ["npm","start"]

FROM node:18

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install --legacy-peer-deps

COPY . .

RUN npm run build

RUN npm install -g serve

EXPOSE 3000

CMD ["npm", "start"]
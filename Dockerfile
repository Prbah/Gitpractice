#################################################
#CREATING A BASE IMAGE FOR A MULTI STAGE DOCKER FILE
################################################

FROM node:18-alpine AS Builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

###############################################
#RUNTIME IMAGE CREATION
##############################################

FROM node:18-alpine

COPY --from=builder /app ./

EXPOSE 8000
CMD ["npm","start"]

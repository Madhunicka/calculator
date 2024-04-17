## STAGE 1: BUILDING ANGULAR APPLICATION ##

FROM node:20.12.1 as build

COPY . .
WORKDIR /calculator


RUN npm install
RUN $(npm bin)/ng build 

##STAGE 2: RUN NGINX TO SERVER APPLICATION ##

FROM nginix
COPY --from=build /calculator/dist/calculator /usr/share/nginix/html/

EXPOSE 80
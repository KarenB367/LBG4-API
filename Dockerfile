# Node base image.
FROM node:14.19.1
# Create and set the work directory inside the current directory
WORKDIR /dockerapp
# Copy the app file & dependancies into the image working directory
COPY . .
# Run npm install
RUN npm install
# State the listening port for the container.
ENV PORT=8080 
# The app's code does not actually specify the port, so it would be useful to include here.
# This is the main process.
ENTRYPOINT ["npm", "start"]

# ---- Base Node -----
FROM node:8.11.1-alpine as base
# setting working directory
WORKDIR /app
# copy everything, check .dockerignore, to check what is not being copuied
COPY . ./
# --- Dependencies ---
FROM base as dependencies
# install npm packages within package json
RUN npm install
# --- Final ---
FROM dependencies as done
COPY --from=dependencies /app/ /app/
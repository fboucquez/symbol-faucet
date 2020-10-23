FROM node:10 AS builder
# RUN apk update && apk upgrade && apk add --no-cache \
#   make \
#   g++ \
#   python
WORKDIR /app
COPY . .
RUN npm install && npm run build

FROM node:10 AS runner
WORKDIR /app
COPY --from=builder /app /app
CMD ["npm", "start"]

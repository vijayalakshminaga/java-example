FROM maven:amazoncorrettto AS builder
WORKDIR /app
COPY . .
RUN mvn clean install -U
FROM tomcat
COPY --from=builder /app/target/works-with-heroku-1.0.war /app/app.war
EXPOSE 9000
CMD ["java","-war","/app/app.war"]

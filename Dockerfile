# Stage 1: Build WAR bằng Maven Wrapper (Java 17)
FROM maven:3.9.4-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN ./mvnw -B -DskipTests clean package && \
    ls -la /app/target/ && \
    test -f /app/target/demo4-1.0-SNAPSHOT.war || (echo "WAR file not found!" && exit 1)

# Stage 2: Chạy Tomcat 11 (Jakarta EE 10: Servlet 6.0 / JSP 3.1 / JSTL 3.0.1)
FROM tomcat:11.0-jdk17

# Tắt shutdown port 8005 để tránh spam log trên Render
RUN sed -i 's/port="8005"/port="-1"/' /usr/local/tomcat/conf/server.xml

# Xóa webapp mặc định và deploy WAR của bạn vào ROOT (context "/")
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=build /app/target/demo4-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Expose port và cấu hình log
EXPOSE 8080
ENV CATALINA_OUT=/usr/local/tomcat/logs/catalina.out

# Health check
HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost:8080/ || exit 1

CMD ["catalina.sh", "run"]
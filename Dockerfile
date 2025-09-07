# Sử dụng base image Tomcat 11 (Java 17)
FROM tomcat:11.0.0-jdk17-temurin

# Xóa webapps mặc định để Tomcat sạch sẽ
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR file vào Tomcat
# Giả sử bạn đã build bằng Maven/Gradle và có file target/demo4.war
COPY target/demo4.war /usr/local/tomcat/webapps/ROOT.war

# Mở port 8080
EXPOSE 8080

# Khởi động Tomcat
CMD ["catalina.sh", "run"]

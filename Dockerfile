FROM        redhat/ubi9
RUN         dnf install java-17-openjdk java-17-openjdk-devel maven -y
WORKDIR     /app
RUN         useradd -d /app roboshop && chown roboshop:roboshop /app
USER        roboshop
COPY        src/ /app/src/
COPY        pom.xml /app/pom.xml
RUN         mvn clean package
CMD        ["java", "-jar", "/app/target/shipping-1.0.jar"]
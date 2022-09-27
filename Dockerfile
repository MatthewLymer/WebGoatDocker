FROM eclipse-temurin:19_36-jre-jammy

RUN useradd -ms /bin/bash webgoat
RUN chgrp -R 0 /home/webgoat
RUN chmod -R g=u /home/webgoat

USER webgoat

WORKDIR /home/webgoat

EXPOSE 8080

RUN curl -sSL https://github.com/WebGoat/WebGoat/releases/download/v8.2.2/webgoat-server-8.2.2.jar --output webgoat-server-8.2.2.jar

ENTRYPOINT [ "java", \
    "-Dfile.encoding=UTF-8", \
    "--add-opens", "java.base/java.lang=ALL-UNNAMED", \
    "--add-opens", "java.base/java.util=ALL-UNNAMED", \
    "--add-opens", "java.base/java.lang.reflect=ALL-UNNAMED", \
    "--add-opens", "java.base/java.text=ALL-UNNAMED", \
    "--add-opens", "java.desktop/java.beans=ALL-UNNAMED", \
    "--add-opens", "java.desktop/java.awt.font=ALL-UNNAMED", \
    "--add-opens", "java.base/sun.nio.ch=ALL-UNNAMED", \
    "--add-opens", "java.base/java.io=ALL-UNNAMED", \
    "--add-opens", "java.base/java.util=ALL-UNNAMED", \
    "-Drunning.in.docker=true", \
    "-Dserver.address=0.0.0.0", \
    "-Dserver.port=8080", \
    "-jar", "webgoat-server-8.2.2.jar" ]

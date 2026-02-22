FROM oven/bun:latest

COPY build.sh /tmp/build.sh

RUN sed -i 's/\r$//' /tmp/build.sh && \
    chmod +x /tmp/build.sh && \
    /tmp/build.sh && \
    rm -rf /tmp/build.sh

CMD  ["/bin/bash"]
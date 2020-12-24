FROM ubuntu:18.04

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y --no-install-recommends git curl


ENV JDK_VERSION_MAJOR 8
ENV JDK_VERSION_UPDATE 202

ENV JDK_VERSION ${JDK_VERSION_MAJOR}u${JDK_VERSION_UPDATE}
ENV JDK_VERSION_DOT 1.${JDK_VERSION_MAJOR}.0
ENV JDK_VERSION_DOT_UPDATE ${JDK_VERSION_DOT}_${JDK_VERSION_UPDATE}
ENV JDK_DOWNLOAD http://storage.exoplatform.org/public/java/jdk/oracle/${JDK_VERSION}/jdk-${JDK_VERSION}-linux-x64.tar.gz

ENV JVM_DIR /usr/lib/jvm
RUN mkdir -p "${JVM_DIR}"

RUN cd "${JVM_DIR}" \
  && curl -L ${JDK_DOWNLOAD} -o jdk-${JDK_VERSION}-linux-x64.tar.gz \
  && tar --no-same-owner -xzf "jdk-${JDK_VERSION}-linux-x64.tar.gz" \
  && rm -f "jdk-${JDK_VERSION}-linux-x64.tar.gz" 

ENV JAVA_HOME ${JVM_DIR}/jdk${JDK_VERSION_DOT_UPDATE}
ENV PATH $JAVA_HOME/bin:$PATH


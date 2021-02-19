FROM eu.gcr.io/vf-grp-shared-services-nonlive/python36-mvn3-java11-ansible:v0.02
WORKDIR /app


# Setup Proxies
ENV HTTP_PROXY http://outbound-proxy.neuron.shared-services.vf.local:3128
ENV http_proxy ${HTTP_PROXY}
ENV HTTPS_PROXY ${HTTP_PROXY}
ENV https_proxy ${HTTP_PROXY}
ENV NO_PROXY "localhost,.googleapis.com,.gcr.io,.google.com,.svc.cluster.local,.vf.local"
ENV no_proxy "${NO_PROXY}"
RUN git config --global http.proxy ${HTTP_PROXY} && git config --global https.proxy ${HTTPS_PROXY}

# Install Requirements
COPY requirements.txt .
RUN pip install --upgrade pip --trusted-host https://beta-apps.neuron.bdp.vodafone.com/nexus
RUN pip install --trusted-host https://beta-apps.neuron.bdp.vodafone.com/nexus --no-cache-dir -r requirements.txt
RUN rm requirements.txt

# Unset Proxies
ENV HTTP_PROXY ""
ENV http_proxy ${HTTP_PROXY}
ENV HTTPS_PROXY ${HTTP_PROXY}
ENV https_proxy ${HTTP_PROXY}
ENV NO_PROXY ""
ENV no_proxy "${NO_PROXY}"

# Run Tests
COPY ./src ./src
COPY __init__.py .
COPY ./tests ./tests
RUN pytest --cache-clear
RUN rm -r ./tests

# Setup Entrypoint
ENTRYPOINT ["python", "src"]

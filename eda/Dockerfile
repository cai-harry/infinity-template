FROM eu.gcr.io/vf-grp-shared-services-nonlive/tensorflow_jupyterlab:0.0.1



# Setup Proxies
ENV HTTP_PROXY http://outbound-proxy.neuron.shared-services.vf.local:3128
ENV http_proxy ${HTTP_PROXY}
ENV HTTPS_PROXY ${HTTP_PROXY}
ENV https_proxy ${HTTP_PROXY}
ENV NO_PROXY "localhost,.googleapis.com,.gcr.io,.google.com,.svc.cluster.local,.vf.local"
ENV no_proxy "${NO_PROXY}"
RUN git config --global http.proxy ${HTTP_PROXY} && git config --global https.proxy ${HTTPS_PROXY}

COPY requirements.txt .
RUN pip3 install --trusted-host https://beta-apps.neuron.bdp.vodafone.com/nexus --no-cache-dir -r /tmp/requirements.txt
ENTRYPOINT ["tini", "--"]
CMD ["sh","-c", "jupyter lab --notebook-dir=/home/${NB_USER} --ip=0.0.0.0 --no-browser --allow-root --port=8888 --NotebookApp.token='' --NotebookApp.password='' --NotebookApp.allow_origin='*' --NotebookApp.base_url=${NB_PREFIX}"]

# Unset Proxies
ENV HTTP_PROXY ""
ENV http_proxy ${HTTP_PROXY}
ENV HTTPS_PROXY ${HTTP_PROXY}
ENV https_proxy ${HTTP_PROXY}
ENV NO_PROXY ""
ENV no_proxy "${NO_PROXY}"

FROM docker.io/semaphoreui/semaphore:v2.17.26

# renovate: datasource=pypi depName=ansible packageName=ansible versioning=semver
ARG ANSIBLE_VERSION=11.1.0
ENV ANSIBLE_VERSION=${ANSIBLE_VERSION}
ARG ANSIBLE_VENV_PATH=/opt/semaphore/apps/ansible/${ANSIBLE_VERSION}/venv

RUN mkdir -p ${ANSIBLE_VENV_PATH} && \
    python3 -m venv ${ANSIBLE_VENV_PATH} --system-site-packages && \
    source ${ANSIBLE_VENV_PATH}/bin/activate && \
    pip3 install --upgrade pip ansible==${ANSIBLE_VERSION} && \
    find ${ANSIBLE_VENV_PATH} -iname __pycache__ | xargs rm -rf

ENV VIRTUAL_ENV="$ANSIBLE_VENV_PATH"
ENV PATH="$ANSIBLE_VENV_PATH/bin:$PATH"

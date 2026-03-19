FROM docker.io/semaphoreui/semaphore:v2.17.26

USER root

# renovate: datasource=pypi depName=ansible packageName=ansible versioning=semver
ARG CURRENT_ANSIBLE_VERSION=13.4.0
ENV CURRENT_ANSIBLE_VERSION=${CURRENT_ANSIBLE_VERSION}
ENV CURRENT_ANSIBLE_VENV_PATH=/opt/semaphore/apps/ansible/${CURRENT_ANSIBLE_VERSION}/venv

RUN echo ${CURRENT_CURRENT_ANSIBLE_VENV_PATH} && \
    mkdir -p "${CURRENT_ANSIBLE_VENV_PATH}" && \
    python3 -m venv ${CURRENT_ANSIBLE_VENV_PATH} --system-site-packages && \
    source ${CURRENT_ANSIBLE_VENV_PATH}/bin/activate && \
    pip3 install --upgrade pip ansible==${CURRENT_ANSIBLE_VERSION} && \
    find ${CURRENT_ANSIBLE_VENV_PATH} -iname __pycache__ | xargs rm -rf

ENV VIRTUAL_ENV="$CURRENT_ANSIBLE_VENV_PATH"
ENV PATH="$CURRENT_ANSIBLE_VENV_PATH/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

USER 1001

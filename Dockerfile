# See CKAN docs on installation from Docker Compose on usage
FROM debian:jessie
MAINTAINER Open Knowledge

# Install required system packages
RUN apt-get -q -y update \
    && DEBIAN_FRONTEND=noninteractive apt-get -q -y upgrade \
    && apt-get -q -y install \
        python-dev \
        python-pip \
        python-virtualenv \
        python-wheel \
        libpq-dev \
        libxml2-dev \
        libxslt-dev \
        libgeos-dev \
        libssl-dev \
        libffi-dev \
        postgresql-client \
        build-essential \
        git-core \
        vim \
        wget \
    && apt-get -q clean \
    && rm -rf /var/lib/apt/lists/*

# Define environment variables
ENV CKAN_HOME /usr/lib/ckan
ENV CKAN_VENV $CKAN_HOME/venv
ENV CKAN_CONFIG /etc/ckan
ENV CKAN_STORAGE_PATH=/var/lib/ckan
ENV CKAN_SQLALCHEMY_URL postgresql://ckan:$ckan@db/ckan

# Build-time variables specified by docker-compose.yml / .env
ARG CKAN_SITE_URL

# Create ckan user
RUN useradd -r -u 900 -m -c "ckan account" -d $CKAN_HOME -s /bin/false ckan

# Setup virtual environment for CKAN
RUN mkdir -p $CKAN_VENV $CKAN_CONFIG $CKAN_STORAGE_PATH && \
    virtualenv $CKAN_VENV && \
    ln -s $CKAN_VENV/bin/pip /usr/local/bin/ckan-pip &&\
    ln -s $CKAN_VENV/bin/paster /usr/local/bin/ckan-paster

# Setup CKAN
ADD . $CKAN_VENV/src/ckan/
RUN ckan-pip install -U pip && \
    ckan-pip install --upgrade --no-cache-dir -r $CKAN_VENV/src/ckan/requirement-setuptools.txt && \
    ckan-pip install --upgrade --no-cache-dir -r $CKAN_VENV/src/ckan/requirements.txt && \
    ckan-pip install -e $CKAN_VENV/src/ckan/ && \
    ln -s $CKAN_VENV/src/ckan/ckan/config/who.ini $CKAN_CONFIG/who.ini && \
    cp -v $CKAN_VENV/src/ckan/contrib/docker/ckan-entrypoint.sh /ckan-entrypoint.sh && \
    chmod +x /ckan-entrypoint.sh && \
    chown -R ckan:ckan $CKAN_HOME $CKAN_VENV $CKAN_CONFIG $CKAN_STORAGE_PATH

ENTRYPOINT ["/ckan-entrypoint.sh"]

USER ckan
EXPOSE 5000

RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install ckantoolkit
RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install ckanapi
# RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install geoalchemy2
# RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install git+https://github.com/eawag-rdm/lucparser
# RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install lxml
# RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install shapely
RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install -e git+https://github.com/ckan/ckanext-hierarchy.git#egg=ckanext-hierarchy
# RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install -e git+https://github.com/WolfgangDeigele/ckanext-grouphierarchy-deigele.git#egg=ckanext-grouphierarchy-deigele
# RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install -e git+https://github.com/WolfgangDeigele/ckanext-scheming-deigele.git#egg=ckanext-scheming-deigele
# RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install -e git+https://github.com/WolfgangDeigele/ckanext-spatial-deigele.git#egg=ckanext-spatial-deigele
# RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install -e git+https://github.com/ckan/ckanext-geoview.git#egg=ckanext-geoview
# RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install -e git+https://github.com/MandanaMoshref/ckanext-repeating.git#egg=ckanext-repeating
# RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install -e git+https://github.com/MandanaMoshref/ckanext-composite.git#egg=ckanext-composite
# RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install -e git+https://github.com/WolfgangDeigele/ckanext-relation-deigele.git#egg=ckanext-relation-deigele
# RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install -e git+https://github.com/ckan/ckanext-disqus.git#egg=ckanext-disqus
# RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install -e git+https://github.com/WolfgangDeigele/ckanext-temporalsearch-deigele.git#egg=ckanext-temporalsearch-deigele
# RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install -e git+https://github.com/WolfgangDeigele/ckanext-userautoaddgroup-deigele.git#egg=ckanext-userautoaddgroup-deigele
# RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install -e git+https://github.com/WolfgangDeigele/ckanext-restricted-deigele.git#egg=ckanext-restricted-deigele
# RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install -e git+https://github.com/datopian/ckanext-gdpr.git#egg=ckanext-gdpr


ADD production.ini $CKAN_CONFIG/production.ini

CMD ["ckan-paster","serve","/etc/ckan/production.ini"]



# See CKAN docs on installation from Docker Compose on usage
FROM debian:jessie
MAINTAINER Open Knowledge

# Install required system packages
RUN apt-get -q -y update \
    && DEBIAN_FRONTEND=noninteractive apt-get -q -y upgrade \
    && apt-get -q -y install \
    	  curl \
        python-dev \
        python-pip \
        python-virtualenv \
        python-wheel \
        libpq-dev \
        libxml2-dev \
        libxslt-dev \
        libgeos-dev \
        libssl-dev \
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
    && apt-get install -y dos2unix

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
    virtualenv $CKAN_VENV

RUN curl -o $CKAN_VENV/get-pip.py https://bootstrap.pypa.io/pip/2.7/get-pip.py && \
    . $CKAN_VENV/bin/activate && python $CKAN_VENV/get-pip.py 'pip==20.3.3' && \
    ln -s $CKAN_VENV/bin/pip /usr/local/bin/ckan-pip &&\
    ln -s $CKAN_VENV/bin/paster /usr/local/bin/ckan-paster 

RUN rm -rf $CKAN_VENV/get-pip.py

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
RUN dos2unix /ckan-entrypoint.sh && apt-get --purge remove -y dos2unix && rm -rf /var/lib/apt/lists/*                                                                                                         

ENTRYPOINT ["/ckan-entrypoint.sh"]

USER ckan
EXPOSE 5000

RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install ckantoolkit
RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install ckanapi
RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install geoalchemy2
RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install git+https://github.com/eawag-rdm/lucparser
RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install lxml
RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install shapely
RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install requests
RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install -e git+https://github.com/ckan/ckanext-hierarchy.git#egg=ckanext-hierarchy
RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install -e git+https://github.com/tum-gis/ckanext-grouphierarchy-sddi.git#egg=ckanext-grouphierarchy-sddi
RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install -e git+https://github.com/tum-gis/ckanext-scheming-sddi.git#egg=ckanext-scheming-sddi
RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install -e git+https://github.com/tum-gis/ckanext-spatial-sddi.git#egg=ckanext-spatial-sddi
RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install -e git+https://github.com/ckan/ckanext-geoview.git#egg=ckanext-geoview
RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install -e git+https://github.com/tum-gis/ckanext-repeating-sddi.git#egg=ckanext-repeating-sddi
RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install -e git+https://github.com/tum-gis/ckanext-composite-sddi.git#egg=ckanext-composite-sddi
RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install -e git+https://github.com/tum-gis/ckanext-relation-sddi.git#egg=ckanext-relation-sddi
RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install -e git+https://github.com/ckan/ckanext-disqus.git#egg=ckanext-disqus
RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install -e git+https://github.com/tum-gis/ckanext-temporalsearch-sddi.git#egg=ckanext-temporalsearch-sddi
RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install -e git+https://github.com/tum-gis/ckanext-userautoaddgroup-sddi.git#egg=ckanext-userautoaddgroup-sddi
RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install -e git+https://github.com/tum-gis/ckanext-restricted-sddi.git#egg=ckanext-restricted-sddi
RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install -e git+https://github.com/datopian/ckanext-gdpr.git#egg=ckanext-gdpr
RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install -e git+https://github.com/tum-gis/ckanext-importerexporter-sddi.git#egg=ckanext-importerexporter-sddi


ADD production.ini $CKAN_CONFIG/production.ini

CMD ["ckan-paster","serve","/etc/ckan/production.ini"]



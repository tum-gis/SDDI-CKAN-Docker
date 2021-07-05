FROM solr:6.6.2

# Enviroment
ENV SOLR_CORE ckan
ENV SOLR_VERSION 6.6.2


# Create Directories
RUN mkdir -p /opt/solr/server/solr/$SOLR_CORE/conf
RUN mkdir -p /opt/solr/server/solr/$SOLR_CORE/data

# Adding Files
COPY ./solr/solrconfig.xml /opt/solr/server/solr/$SOLR_CORE/conf/
ADD https://raw.githubusercontent.com/tum-gis/SDDI-CKAN-Docker/ckan-sddi/SDDI-CKAN-Docker%20source%20files/ckan/config/solr/schema.xml \
https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/$SOLR_VERSION/solr/server/solr/configsets/basic_configs/conf/currency.xml \
https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/$SOLR_VERSION/solr/server/solr/configsets/basic_configs/conf/synonyms.txt \
https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/$SOLR_VERSION/solr/server/solr/configsets/basic_configs/conf/stopwords.txt \
https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/$SOLR_VERSION/solr/server/solr/configsets/basic_configs/conf/protwords.txt \
https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/$SOLR_VERSION/solr/server/solr/configsets/data_driven_schema_configs/conf/elevate.xml \
/opt/solr/server/solr/$SOLR_CORE/conf/

# Create Core.properties
RUN echo name=$SOLR_CORE > /opt/solr/server/solr/$SOLR_CORE/core.properties

# Add JTS jar file
ADD ./solr/jts-core-1.14.0.jar /opt/solr/server/solr-webapp/webapp/WEB-INF/lib/jts-1.14.0.jar

# Giving ownership to Solr

USER root

RUN chown -R "$SOLR_USER:$SOLR_USER" /opt/solr/server/solr/$SOLR_CORE

# User
USER $SOLR_USER:$SOLR_USER
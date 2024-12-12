FROM ckan/ckan-base:2.9-py3.9
# Install any extensions needed by your CKAN instance
# See Dockerfile.dev for more details and examples

USER root
RUN apt-get install -y python3-dev libxml2-dev libxslt1-dev libgeos-c1v5 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN chown -R ckan: /srv/app

USER ckan

RUN pip3 install -e 'git+https://github.com/mosoriob/ckanext-oauth2.git@34db1eec79912b7d14bcceac235b30e53871e082#egg=ckanext-oauth2'
RUN pip3 install -e "git+https://github.com/ckan/ckanext-spatial.git#egg=ckanext-spatial"

RUN pip install ckanext-geoview

ADD requirements/ckanext-spatial.txt /tmp/
RUN pip3 install -r /tmp/ckanext-spatial.txt
# Add plugins
ADD --chown=503:502 ckanext/ckanext-tacc_theme /srv/app/src/ckanext-tacc_theme
RUN cd /srv/app/src/ckanext-tacc_theme && pip install -e .
#RUN cd /srv/app/src/ckanext-tacc_theme
# Copy custom initialization scripts
COPY docker-entrypoint.d/* /docker-entrypoint.d/

# Apply any patches needed to CKAN core or any of the built extensions (not the
# runtime mounted ones)
COPY patches ${APP_DIR}/patches

RUN for d in $APP_DIR/patches/*; do \
    if [ -d $d ]; then \
    for f in `ls $d/*.patch | sort -g`; do \
    cd $SRC_DIR/`basename "$d"` && echo "$0: Applying patch $f to $SRC_DIR/`basename $d`"; patch -p1 < "$f" ; \
    done ; \
    fi ; \
    done
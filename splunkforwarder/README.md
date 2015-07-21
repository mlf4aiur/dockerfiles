Docker container for Splunkforwarder
====================================

Docker container for the Splunkforwarder.

Usage
-----

    docker run \
        --name splunkforwarder \
        --link=splunk:splunk \
        -d \
        -p 514:514 \
        -p 8089:8089 \
        -v `pwd`/var:/opt/splunkforwarder/var \
        mlf4aiur/splunkforwarder

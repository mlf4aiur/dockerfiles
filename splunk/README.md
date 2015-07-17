Docker container for Splunk
============================

Docker container for the Splunk.

Usage
-----

    docker run \
        --name splunk \
        -d \
        -p 514:514 \
        -p 8000:8000 \
        -p 8089:8089 \
        -p 8191:8191 \
        -p 9997:9997 \
        -v `pwd`/var:/opt/splunk/var \
        mlf4aiur/splunk

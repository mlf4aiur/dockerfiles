fpm in a container
==================

Docker container for build rpm with fpm.

Usage
-----

Put your package into `data/` directory and run following command, then you'll get the rpm file in you data directory.

    docker run -i -t --rm -v `pwd`/data:/data mlf4aiur/fpm_rpm fpm \
        --verbose \
        -f \
        -s dir \
        -t rpm \
        --name hello_world \
        -v 0.9.0 \
        --config-files opt/hello_world/ \
        --exclude "*/*.pyc" \
        --depends python \
        opt/hello_world

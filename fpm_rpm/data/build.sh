fpm \
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

Notebook with pandas in a container
===================================

Docker container for the IPython notebook (with pandas).

Usage
-----

    docker run -i -t --rm -v `pwd`/notebooks:/notebooks -p 8888:8888 -e "PASSWORD=YOURPASSWORD" mlf4aiur/pandas

You'll now be able to access your notebook at https://localhost:8888 with password YOURPASSWORD.

**Using HTTP**

This docker image by default runs IPython notebook in HTTPS. If you'd like to run this in HTTP, you can use the USE_HTTP environment variable. Setting it to a non-zero value enables HTTP.

    docker run -i -t --rm -v `pwd`/notebooks:/notebooks -p 8888:8888 -e "PASSWORD=YOURPASSWORD" -e "USE_HTTP=1" mlf4aiur/pandas

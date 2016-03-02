FROM andrewosh/binder-base

MAINTAINER Andrew Osheroff <andrewosh@gmail.com>

USER root

# Add Julia dependencies
RUN apt-get update
RUN wget https://julialang.s3.amazonaws.com/bin/linux/x64/0.4/julia-0.4.3-linux-x86_64.tar.gz
RUN tar zxvf julia-0.4.3-linux-x86_64.tar.gz
RUN cd julia-a2f713dea5/bin/

USER main

# Install Julia kernel
RUN julia-a2f713dea5/bin/julia -e 'Pkg.add("IJulia")'
RUN julia-a2f713dea5/bin/julia -e 'Pkg.add("Gadfly")' && julia -e 'Pkg.add("RDatasets")'

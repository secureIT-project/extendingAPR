FROM linasvidz/genprog:latest

RUN mkdir /opt/Repair/

COPY Repair/ /opt/Repair/Repair/
COPY Makefile /opt/Repair/Makefile
COPY termination.prp /opt/Repair/termination.prp

COPY Bugs/ /opt/Bugs/

RUN apt-get update
RUN apt-get install -y wget gdb python3-pip openjdk-11-jdk

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 10
RUN python3 -m pip install pathlib argparse lizard

WORKDIR /opt/Repair/

RUN make setup

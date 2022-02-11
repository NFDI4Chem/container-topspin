FROM centos:7

#COPY topspin-4.1.1.2-linux.sh /tmp
#RUN chmod +x /tmp/topspin-4.1.1.2-linux.sh

RUN yum -y --nogpgcheck install https://repo-bbio.bruker.com/CentOS/7/Bruker-Addon/bruker-addon-latest.x86_64.rpm
RUN yum install -y epel-release
RUN yum install -y --enablerepo=bruker   bruker-topspin-environ  yum install --enablerepo=bruker   bruker-topspin-environ

RUN yum install -y xorg-x11-server-Xvfb.x86_64

COPY topspin-4.1.1.2-linux.sh /tmp
RUN chmod +x /tmp/topspin-4.1.1.2-linux.sh

#RUN xvfb-run /tmp/topspin-4.1.1.2-linux.sh
#RUN useradd -u 1000 brukercustomer
#USER 1000

RUN xvfb-run /tmp/topspin-4.1.1.2-linux.sh --nox11 -- -a --no-rellet --no-icons --no-clean --no-password --no-control-terminal --setup-type cu --select topspin --gcc-off

ENV QT_X11_NO_MITSHM=1
ENV _X11_NO_MITSHM=1
ENV _MITSHM=0
ENV LD_LIBRARY_PATH=/opt/topspin4.1.1/prog/shlib/

ADD myjcampdx.sh /usr/bin
ENTRYPOINT [ "/usr/bin/myjcampdx.sh" ]


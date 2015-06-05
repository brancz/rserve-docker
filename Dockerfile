FROM ubuntu
MAINTAINER Frederic Branczyk, fbranczyk@gmail.com

RUN apt-get update
RUN apt-get install -y --force-yes wget r-base r-base-dev libcurl4-gnutls-dev libxml2-dev libmime-base64-urlsafe-perl libdigest-hmac-perl libdigest-sha-perl
RUN wget http://cran.r-project.org/src/contrib/Archive/Rserve/Rserve_1.7-2.tar.gz && R CMD INSTALL Rserve_1.7-2.tar.gz
ADD Rserv.conf /etc/Rserv.conf

EXPOSE 6311
CMD R CMD Rserve.dbg --RS-port 6311 --no-save --RS-encoding utf8

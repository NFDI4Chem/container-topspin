# Docker container for Bruker TopSpin

TopSpin is the Bruker software suite for NMR data analysis.
This repository does *not* contain any Bruker licensed software, instead we are providing an example how to install TopSpin into a software container.

## Preface

This repository contains information to install the Linux version of TopSpin into a CentOS 7.x container. We used information from:

Following
* https://www.bruker.com/protected/en/services/user-manuals/nmr/installation.html (TopSpin 4.0 Installation Guide, Section 2.7)
* https://cdn.dal.ca/content/dam/dalhousie/pdf/Diff/nmr3/NMR%20Software/install_ts4.pdf
* https://repo-bbio.bruker.com/CentOS/7/TopSpinInstallationRequirements.html

To use the resulting installation, please

1. Obtain a valid license. Academic customers can get a free license, e.g. by going to https://www.bruker.com/protected/en/services/software-downloads/nmr/nmr-topspin-license-for-academia.html
1. Obtain the software installation file from https://www.bruker.com/protected/en/services/software-downloads/nmr/linux/linux-topspin.html (Section `Current Releases` with `TopSpin 4.x.y & CMC-assist`)
 e.g. the `topspin-4.1.1.2-linux.sh` from Bruker and place it into the directory where the `Dockerfile` resides.

## Building

The base container can be built with
```
docker build -t nfdi4chem/topspin:latest .
docker tag nfdi4chem/topspin:latest nfdi4chem/topspin:4.1.1.2-0.3
```
Tagging with a specific version is recommended.

## Running

```
docker run -v $PWD/testdata:/data --rm -it nfdi4chem/topspin:4.1.1.2-0.3 /data/ADG10003u_023 /data/out.jdx
```

The included test data `ADG10003u_023` is a urine sample in the metabolomics study "MTBLS1: A metabolomic study of urinary changes in type 2 diabetes in human compared to the control group" https://www.ebi.ac.uk/metabolights/MTBLS1/.

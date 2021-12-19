FROM alpine:3.15
RUN apk update; apk add texlive git bash
RUN git clone https://github.com/git-vcs/pdf-merge
RUN find . \( ! -regex '.*/\..*' \) -type f -name "*"
ADD docker-script.sh .
RUN chmod 777 docker-script.sh
CMD ./docker-script.sh

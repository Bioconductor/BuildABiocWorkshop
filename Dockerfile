FROM bioconductor/bioconductor_docker:devel

WORKDIR /home/rstudio

RUN echo $PWD
RUN ls

COPY --chown=rstudio:rstudio . /home/rstudio/

RUN echo $PWD
RUN ls

RUN Rscript -e "devtools::install('.', dependencies=TRUE, repos = BiocManager::repositories())"
RUN chown -R rstudio:rstudio .

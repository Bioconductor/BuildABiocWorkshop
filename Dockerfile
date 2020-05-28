FROM bioconductor/bioconductor_docker:devel

WORKDIR /home/rstudio

COPY . /home/rstudio/

RUN Rscript -e "devtools::install('.', dependencies=TRUE, repos = BiocManager::repositories())"
RUN chown -R rstudio:rstudio .
